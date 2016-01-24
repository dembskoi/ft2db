require 'csv'

class Result < ActiveRecord::Base
  mount_uploader :res, ResultUploader

  belongs_to :type
  belongs_to :equation
  belongs_to :experiment

  GAS = %w(H D He DHe HHe)
  MAX_FILE_LENGTH = 48
  COLUMN_NAMES = %w(standard_data scalar_data vector_data)

  validates_inclusion_of :gas, in: GAS
  validates_presence_of :name, :time, :gas, :type_id, :standard_data, :scalar_data, :vector_data

  before_validation :validate_file_length, :parse_input_file
  before_save :update_if_exists

  def self.to_csv
    CSV.generate do |csv|
      csv << COLUMN_NAMES
      all.each do |item|
        csv << item.attributes.values_at(*COLUMN_NAMES)
      end
    end
  end

  def to_csv
    CSV.generate do |csv|
      csv << COLUMN_NAMES
      csv << attributes.values_at(*COLUMN_NAMES)
    end
  end

  private

  def validate_file_length
    count_of_lines = %x{wc -l #{res.current_path}}.split[0].to_i
    errors.add(:res, "#{res.identifier} length more than 48 lines" ) if count_of_lines > MAX_FILE_LENGTH
  end

  def parse_input_file
    self.name = res.identifier.split('.').first
    File.foreach(res.current_path).with_index do |line, index|
      case index
        when 0
          parse_standard_data(line)
        when 1
          parse_scalar_keys(line)
        when 2
          parse_scalar_values(line)
        when 3
          parse_vector_keys(line)
        when 4..40
          parse_vector_values(line)
      end
    end
  end

  def parse_standard_data(line)
    standard_data = {}
    line.gsub('standart data fi', '').gsub(/=[\s]/, '=').downcase.split.map do |res|
      key, value = res.split('=')
      standard_data[key] = value
    end
    self.time = standard_data['time']
    self.standard_data = standard_data
  end

  def parse_scalar_keys(line)
    @scalar_keys = line.downcase.split
    @scalar_keys.each { |key| self.scalar_data[key] = []}
  end

  def parse_scalar_values(line)
    scalar_values = line.downcase.split
    @scalar_keys.each_with_index do |key, index|
      self.scalar_data[key] << scalar_values[index]
    end
  end

  def parse_vector_keys(line)
    @vector_keys = line.downcase.split
    @vector_keys.each { |key| self.vector_data[key] = []}
  end

  def parse_vector_values(line)
    vector_values = line.downcase.split
    @vector_keys.each_with_index do |key, index|
      self.vector_data[key] << vector_values[index]
    end
  end

  def update_if_exists
    old_result = Result.find_by(name: name, time: time)

    if old_result.present?
      old_result.standard_data.merge(standard_data)
      old_result.scalar_data.merge(scalar_data)
      old_result.vector_data.merge(vector_data)
      false
    end
  end
end

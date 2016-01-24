class Equation < ActiveRecord::Base
  mount_uploader :equ, EquUploader

  has_many :results

  validates_presence_of :equ

  def self.by_equ_and_id
    all.map { |equation| [equation.equ_identifier, equation.id] }
  end

  def data
    res = File.foreach(equ.current_path).inject('') { |data, line| data + line }

    res.force_encoding('ISO-8859-1').encode('utf-8', replace: nil)
  end
end

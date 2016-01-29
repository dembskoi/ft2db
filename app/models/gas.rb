class Gas < ActiveRecord::Base
  self.table_name = :gases

  has_many :results

  validates_uniqueness_of :name
  validates_presence_of :name

  def self.by_name_and_id
    all.map { |gas| [gas.name, gas.id] }
  end

end

class Type < ActiveRecord::Base
  has_many :results

  validates_uniqueness_of :name
  validates_presence_of :name

  def self.by_name_and_id
    all.map { |type| [type.name, type.id] }
  end

end

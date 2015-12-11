class Experiment < ActiveRecord::Base
  mount_uploader :exp, ExpUploader

  validates_presence_of :exp

  def data
    File.foreach(exp.current_path).inject('') { |data, line| data + line }
  end
end

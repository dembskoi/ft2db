class Experiment < ActiveRecord::Base
  mount_uploader :exp, ExpUploader

  validates_presence_of :exp

  def data
    res = File.foreach(exp.current_path).inject('') { |data, line| data + line }

    res.force_encoding('ISO-8859-1').encode('utf-8', replace: nil)
  end
end

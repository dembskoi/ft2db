class Equation < ActiveRecord::Base
  mount_uploader :equ, EquUploader

  validates_presence_of :equ

  def data
    res = File.foreach(equ.current_path).inject('') { |data, line| data + line }

    res.force_encoding('ISO-8859-1').encode('utf-8', replace: nil)
  end
end

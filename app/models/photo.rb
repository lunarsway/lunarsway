class Photo < ActiveRecord::Base
  is_image

  def self.all_ordered
    self.find(:all, :order => "position ASC")
  end
end

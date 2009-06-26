class Photo < ActiveRecord::Base
  is_attachment :processors => [:thumbnail], :postprocessing => true

  def self.all_ordered
    self.find(:all, :order => "position ASC")
  end
end

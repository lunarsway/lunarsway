class TourDate < ActiveRecord::Base
  def self.recent
    self.find(:all, :conditions => ["show_date >= ?", DateTime.now], :order => "show_date ASC")
  end
end

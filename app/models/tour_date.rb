class TourDate < ActiveRecord::Base
  def self.recent
    self.find(:all, :conditions => ["show_date >= ?", DateTime.now+1], :order => "show_date ASC")
  end
end

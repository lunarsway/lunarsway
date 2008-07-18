class NewsItem < ActiveRecord::Base
  def self.recent
    self.find(:all, :order => "created_at DESC", :limit => 5)
  end
end

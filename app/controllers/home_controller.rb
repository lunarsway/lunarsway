class HomeController < ApplicationController
  layout "standard-layout"
  
  def index
    @news_items = NewsItem.recent
  end
end

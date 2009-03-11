class HomeController < ApplicationController
  layout "standard-layout"
  
  # caches_page :index
  
  def index
    @news_item = NewsItem.recent.first
    @news_items = Array.new
    @news_items << @news_item
    @auth_token = authenticity_token_from_session_id
    
  end
end

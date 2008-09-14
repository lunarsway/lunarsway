class HomeController < ApplicationController
  layout "standard-layout"
  
  # caches_page :index
  
  def index
    @news_items = NewsItem.recent
    @auth_token = authenticity_token_from_session_id
    
  end
end

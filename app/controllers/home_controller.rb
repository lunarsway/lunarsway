class HomeController < ApplicationController
  layout "standard-layout"
  
  def index
    @news_items = NewsItem.recent
    @auth_token = authenticity_token_from_session_id
    
  end
end

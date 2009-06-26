class NewsItemsController < ApplicationController

  before_filter :check_administrator_role, :only => [:new, :update, :edit, :destroy, :create]

  layout "standard-layout"
  # GET /news_items
  # GET /news_items.xml
  def index
    @news_items = NewsItem.find(:all, :order => "created_at DESC")

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @news_items }
    end
  end

  # GET /news_items/1
  # GET /news_items/1.xml
  def show
    @news_item = NewsItem.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @news_item }
    end
  end

end

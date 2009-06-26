class Admin::HomeController < ApplicationController
  before_filter :admin_login_required
  layout "standard-layout"
  
  def index
  end
end

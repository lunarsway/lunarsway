class UsersController < ApplicationController
  layout 'standard-layout'
  
  before_filter :not_logged_in_required, :only => [:new, :create] 
  before_filter :check_lunarnaut_role, :only => [:show, :edit, :update]
  before_filter :check_administrator_role, :only => [:index, :destroy, :enable]
  
  def index
    @users = User.find(:all)
  end
  
  #This show action only allows users to view their own profile
  def show
    @user = current_user
  end
    
  # render new.rhtml
  def new
    @user = User.new
  end
 
  def create
    cookies.delete :auth_token
    @user = User.new(params[:user])
    @user.save!
    @user.give_lunarnaut_permission
    #Uncomment to have the user logged in after creating an account - Not Recommended
    #self.current_user = @user
  flash[:notice] = "Thanks for signing up! Please check your email to activate your account before logging in."
    redirect_to login_path    
  rescue ActiveRecord::RecordInvalid
    flash[:error] = "There was a problem creating your account."
    render :action => 'new'
  end
  
  def edit
    @user = current_user
  end
  
  def update
    @user = current_user
    if @user.update_attributes!(params[:lunarnaut])
      flash[:notice] = "User updated"
      redirect_to edit_my_community_profile_url
    else
      flash[:notice] = "There was an error saving your profile."
      render :action => 'edit'
    end
  end
  
  def destroy
    @user = User.find(params[:id])
    if @user.update_attribute(:enabled, false)
      flash[:notice] = "User disabled"
    else
      flash[:error] = "There was a problem disabling this user."
    end
    redirect_to :action => 'index'
  end
 
  def enable
    @user = User.find(params[:id])
    if @user.update_attribute(:enabled, true)
      flash[:notice] = "User enabled"
    else
      flash[:error] = "There was a problem enabling this user."
    end
      redirect_to :action => 'index'
  end
 
end
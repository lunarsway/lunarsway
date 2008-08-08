ActionController::Routing::Routes.draw do |map|
  map.resources :lunar_releases

  map.resources :mailing_list_items

  map.resources :roles
  map.resource :session, :member => {
    :admin            => :get
  }
  map.resources :pages
  map.resources :tour_dates
  map.resources :links
  map.resources :photos, :member => {
    :custom           => :get,
    :large            => :get,
    :gallery          => :get
  }
  map.resources :news_items

  map.signup '/signup', :controller => 'users', :action => 'new'
  map.login '/login', :controller => 'sessions', :action => 'new'
  map.logout '/logout', :controller => 'sessions', :action => 'destroy'
  map.activate '/activate/:id', :controller => 'accounts', :action => 'show'
  map.forgot_password '/forgot_password', :controller => 'passwords', :action => 'new'
  map.reset_password '/reset_password/:id', :controller => 'passwords', :action => 'edit'
  map.change_password '/change_password', :controller => 'accounts', :action => 'edit'
  
  # See how all your routes lay out with "rake routes"
  map.resources :pages
 
  map.resources :users, :member => { :enable => :put } do |users|
    users.resource :account
    users.resources :roles
  end
  
  map.resource :session
  map.resource :password

  map.connect '', :controller => "/home"
  map.home "/", :controller => "/home"
  map.news "/news", :controller => "/news_items"
  map.downloads "/downloads", :controller => "/home", :action => "downloads"
  map.video "/video", :controller => "/home", :action => "video"
  map.photos "/photos", :controller => "/photos", :action => "index"
  map.biography "/biography", :controller => "/home", :action => "biography"
  map.philosophy "/philosophy", :controller => "/home", :action => "philosophy"
  map.links "/links", :controller => "/links"
  map.tour "/tour", :controller => "/tour_dates"
  map.route "/song_downloads", :controller => "/song_downloads"

  map.connect '/news_items', :controller => "/news_items", :action => "index"

  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end

ActionController::Routing::Routes.draw do |map|
  map.resources :sites, :only => [:new, :create, :edit, :update], :member => [:change_theme]
  map.resources :pages
  map.resources :projects, :member => [:new_upload, :create_upload], :except => [:destroy]

  map.search 'search', :controller => 'articles', :action => 'search'
  map.resources :tags

  map.comments 'comments', :controller => 'comments', :action => 'all'
  map.resources :articles, :collection => {:search => :get, :tagged => :get} do |article|
    article.resources :comments, :except => [:show]
  end
  map.feed '/feed', :controller => 'articles', :action => 'index', :format => 'atom'

  map.resources :sessions, :only => [:new, :create, :destroy]
  map.login 'login', :controller => 'sessions', :action => 'new'
  map.logout 'logout', :controller => 'sessions', :action => 'destroy'

  map.root :controller => 'articles', :action => 'index'
end

ActionController::Routing::Routes.draw do |map|
  map.comments 'comments', :controller => 'comments', :action => 'all'
  map.feed 'feed', :controller => 'articles', :action => 'index', :format => 'atom'
  map.login 'login', :controller => 'sessions', :action => 'new'
  map.logout 'logout', :controller => 'sessions', :action => 'destroy'
  map.create_contact_form_email '/contact/create_contact_form_email', :controller => "sites", :action => "create_contact_form_email"
  map.contact '/contact', :controller => "sites", :action => "new_contact_form_email"
  
  map.resources :pages
  map.resources :projects, :member => [:new_upload, :create_upload], :except => [:destroy]
  map.resources :tags
  map.resources :articles, :collection => {:tagged => :get} do |article|
    article.resources :comments, :except => [:show]
  end
  map.resources :sessions, :only => [:new, :create, :destroy]

  map.root :controller => 'articles', :action => 'index'
  map.page_slug ':id', :controller => 'pages', :action => 'show'
end

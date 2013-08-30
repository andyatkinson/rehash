Rehash::Application.routes.draw do
  resources :contact_forms, :only => [:new, :create]
  get "contact" => "contact_forms#new", as: :new_contact_form

  resources :articles, :only => [:index, :show] do
    resources :comments, :only => [:new, :create, :edit, :update, :destroy]
    get 'tags/:tag', :on => :collection, :to => "articles#index"
  end
  match '/feed', :to => "articles#index", :defaults => {:format => 'atom'}

  root :to => 'articles#index'
end

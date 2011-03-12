class PagesController < ApplicationController
  before_filter :require_admin, :except => [:show]
  
  make_resourceful do
    actions :all
    
    response_for :update do
      expire_page :controller => :articles, :action => :index
      expire_page :controller => :pages, :action => :show, :id => @page
      flash[:notice] = 'Page updated'
      redirect_to @page
    end
  end
end

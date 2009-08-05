class SitesController < ApplicationController
  before_filter :require_admin, :only => [:edit]
  
  make_resourceful do
    actions :edit, :update

    response_for :update do
      flash[:notice] = "Site updated!"
      redirect_to root_path
    end
  end
  
  def new
    if website
      render :file => "#{RAILS_ROOT}/public/500.html", :status => 401
    else
      @site = Site.new
      flash.now[:error] = "Please create your site"
      render 'new', :layout => 'create_site'
    end
  end
  def create
    @site = Site.new(params[:site])
    if @site.save
      flash[:notice] = "Site created!"
      session[:password] = @site.password
      redirect_to root_path
    else
      flash.now[:error] = "Error"
      render 'new', :layout => 'create_site'
    end
  end
end
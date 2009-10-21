class SitesController < ApplicationController
  before_filter :require_admin, :only => [:edit]
  
  def new
    if website
      render :file => "#{RAILS_ROOT}/public/500.html", :status => 401
    else
      @site = Site.new
      @site.theme = "blue"
      flash.now[:error] = "Please create your site"
      render 'new', :layout => 'create_site'
    end
  end
  def create
    @site = Site.new(params[:site])
    if @site.save
      flash[:notice] = "Site created!"
      session[:password] = @site.hashed_password
      redirect_to edit_site_path(@site)
    else
      flash[:error] = "Error"
      render 'new', :layout => 'create_site'
    end
  end
  def edit
    @site = Site.find(params[:id])
  end
  def update
    @site = Site.find(params[:id])
    if @site.update_attributes(params[:site])
      @site.update_attribute(:hashed_password, Site.encrypted_password(params[:site][:password]))
      session[:password] = @site.hashed_password
      flash[:notice] = "Site updated!"
      redirect_to root_path
    else
      render 'edit'
    end
  end
  def change_theme
    respond_to do |format|
      format.html {
        @site = Site.find(params[:id])
        if params[:theme_name]
          @site.update_attribute(:theme, params[:theme_name])
          flash.now[:notice] = 'Theme changed'
        end
        render 'edit'
      }
      format.json {
        @site = Site.find(params[:id])
        if params[:theme_name]
          @site.update_attribute(:theme, params[:theme_name])
          render :text => 'success'
        end
      }
    end
  end
end
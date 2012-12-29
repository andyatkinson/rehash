class PagesController < ApplicationController
  before_filter :require_admin, :except => [:show]
  before_filter :find_page_by_id, :only => [:edit, :update, :destroy, :show]
  
  def new
    @page = Page.new
  end
  
  def create
    @page = Page.new(params[:page])
    if @page.save
      flash[:notice] = "Page saved."
      redirect_to @page
    else
      render :new
    end
  end
  
  def index
    @pages = Page.all
  end
  
  def edit
  end
  
  def update
    if @page.update_attributes(params[:page])
      flash[:notice] = 'Page updated'
      redirect_to @page
    else
      render :edit
    end
  end
  
  def destroy
    if @page.destroy
      flash[:notice] = 'Page destroyed'
      redirect_to pages_path
    end
  end
  
  def show
  end
end

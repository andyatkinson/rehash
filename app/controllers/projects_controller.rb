class ProjectsController < ApplicationController
  before_filter :require_admin, :except => [:index, :show]
  before_filter :find_project_by_id, :only => [:show, :edit, :update, :new_upload, :create_upload]
  
  def new
    @project = Project.new
  end
  
  def create
    @project = Project.new(params[:project])
    if @project.save
      flash[:notice] = "Project saved."
      redirect_to @project
    else
      render :new
    end
  end
  
  def edit
  end
  
  def show
  end
  
  def update
    if @project.update_attributes(params[:project])
      expire_page :action => :index
      expire_page :action => :show, :id => @project
      flash[:notice] = "Project updated"
      redirect_to @project
    else
      render :edit
    end
  end
  
  def index
    @projects = Project.ordered
  end
  
  def new_upload
    @upload = @project.uploads.build
  end
  
  def create_upload
    @upload = Upload.new(params[:upload])
    if @project.uploads << @upload
      if params[:Filename] 
        # coming from Flash, if HTTP 200 javascript will redirect
        # response doesn't really matter
        render :text => "success", :status => :ok
      else # regular HTML form post
        flash[:notice] = "Upload saved"
        redirect_to @project
      end
    else
      # if you get here verify that imagemagick is installed
      flash[:error] = "Upload not saved."
      render :new_upload
    end
  end
end

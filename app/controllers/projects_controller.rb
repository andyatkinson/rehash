class ProjectsController < ApplicationController
  before_filter :require_admin, :except => [:index, :show]
  
  make_resourceful do
    actions :new, :create, :edit, :update, :show
  end
  
  def index
    @projects = Project.ordered
  end
  
  def new_upload
    @project = Project.find(params[:id])
    @upload = @project.uploads.build
  end
  
  def create_upload
    @project = Project.find(params[:id])
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

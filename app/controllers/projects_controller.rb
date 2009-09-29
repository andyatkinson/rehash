class ProjectsController < ApplicationController
  before_filter :require_admin, :except => [:index, :show]
  
  make_resourceful do
    actions :index, :create, :edit, :update, :show
    
    response_for :create, :update do
      flash[:notice] = "Save successful!"
      redirect_to projects_path
    end
  end
  
  def new
    @project = Project.new
    @project.uploads.build
  end
end

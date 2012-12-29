class TagsController < ApplicationController
  before_filter :require_admin
  before_filter :find_tag_by_id, :except => [:new, :create, :index]
  
  def new
    @tag = Tag.new
  end
  
  def create
    @tag = Tag.new(params[:tag])
    if @tag.save
      flash[:notice] = "Tag created"
      redirect_to @tag
    else
      render :new
    end
  end
  
  def index
    @tags = Tag.all
  end
  
  def edit
  end
  
  def update
    if @tag.update_attributes(params[:tag])
      flash[:notice] = "Tag updated"
      redirect_to @tag
    else
      render :edit
    end
  end
  
  def destroy
    if @tag.destroy
      flash[:notice] = "Tag destroyed"
      redirect_to tags_path
    else
      render :edit
    end
  end
  
  def show
  end
end

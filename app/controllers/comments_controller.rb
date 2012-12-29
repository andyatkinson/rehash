class CommentsController < ApplicationController
  before_filter :require_admin, :except => [:create]
  before_filter :find_article_by_article_id
  
  def index
    @comments = @article.comments
  end
  
  def new
    @comment = @article.comments.build
  end
  
  def create
    @comment = @article.comments.build(params[:comment])
    if @comment.save
      flash[:notice] = 'Comment saved'
      redirect_to @article
    else
      render :new
    end
  end
  
  def edit
    @comment = @article.comments.find(params[:id])
  end
  
  def update
    @comment = @article.comments.find(params[:id])
    if @comment.update_attributes(params[:comment])
      flash[:notice] = 'Comment saved'
      redirect_to comments_path
    else
      render :edit
    end
  end
  
  def destroy
    @comment = @article.comments.find(params[:id])
    if @comment.destroy
      flash[:notice] = 'Comment destroyed'
      redirect_to article_comments_path(@article)
    else
      render :edit
    end
  end
  
  def all
    @comments = Comment.all
    if @comments.any?
      render :partial => 'comments/comment', :collection => @comments, :layout => 'application'
    else
      flash[:error] = "No comments"
      redirect_to root_path
    end
  end
end
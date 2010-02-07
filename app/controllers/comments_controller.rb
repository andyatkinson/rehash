class CommentsController < ApplicationController
  before_filter :require_admin, :except => [:create]
  
  make_resourceful do
    belongs_to :article
    actions :index, :new, :create, :edit, :update, :destroy
    
    response_for :create do
      expire_page :controller => :articles, :action => :index
      expire_page :controller => :articles, :action => :show, :id => @article
      flash[:notice] = 'Comment saved'
      redirect_to @comment.article
    end
    response_for :update do
      expire_page :controller => :articles, :action => :index
      expire_page :controller => :articles, :action => :show, :id => @article
      flash[:notice] = 'Comment saved'
      redirect_to comments_path
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
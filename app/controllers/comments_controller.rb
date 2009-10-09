class CommentsController < ApplicationController
  before_filter :require_admin, :except => [:create]
  
  make_resourceful do
    belongs_to :article
    actions :index, :new, :create, :edit, :update, :destroy
    
    response_for :create do
      flash[:notice] = 'Comment saved'
      redirect_to @comment.article
    end
    # as the admin should be coming from and want to go to index action
    response_for :update do
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
class CommentsController < ApplicationController
  before_filter :require_admin, :except => [:new, :create, :show]
  
  make_resourceful do
    belongs_to :article
    actions :all
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
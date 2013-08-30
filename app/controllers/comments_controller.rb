class CommentsController < ApplicationController
  before_filter :find_article_by_article_id
  before_filter :find_comment, only: [:edit, :update, :destroy]
  before_filter :reject_comment_modifications_unless_author_cookie_present, only: [:edit, :update, :destroy]
 
  def new
    @comment = @article.comments.build
  end
  
  def create
    @comment = @article.comments.build(params[:comment])
    if @comment.save
      unique_identifier = SecureRandom.hex(5)
      cookies['comment'] = {value: unique_identifier, expires: 10.minutes.from_now}
      session[@comment.id] = unique_identifier
      flash[:notice] = 'Comment saved'
      redirect_to @article
    else
      flash[:error] = 'Error saving comment'
      render :new
    end
  end
  
  def edit
  end
  
  def update
    if @comment.update_attributes(params[:comment])
      flash[:notice] = 'Comment saved'
      redirect_to @article
    else
      flash[:error] = 'Error saving comment'
      render :edit
    end
  end
  
  def destroy
    if @comment.destroy
      flash[:notice] = 'Comment removed'
      redirect_to @article
    else
      render :edit
    end
  end

  private

  def find_comment
    @comment = @article.comments.find(params[:id])
  end

  def reject_comment_modifications_unless_author_cookie_present
    unless session[@comment.id] && cookies['comment'] && session[@comment.id] == cookies['comment']
      render nothing: true, status: 404
    end
  end
end

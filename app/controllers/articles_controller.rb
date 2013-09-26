class ArticlesController < ApplicationController
  def index
    if params[:tag]
      flash.now[:notice] = view_context.flash_message_tagged_articles(params[:tag])
      @articles = Article.published.tagged_with(params[:tag]).page(params[:page]).per(5)
    else
      @articles = Article.published.page(params[:page]).per(5)
    end
    respond_to do |format|
      format.html
      format.atom
    end
  end
  
  def show
    if @article = Article.published.find_by_id(params[:id]) 
      render :show
    elsif @article = Article.find_by_old_url(params[:id])
      redirect_to @article
    elsif @article = Article.find_in_parameterized_titles(params[:id])
      redirect_to @article
    end
  end
end

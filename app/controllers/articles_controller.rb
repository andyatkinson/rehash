class ArticlesController < ApplicationController
  def index
    if params[:tag]
      flash[:notice] = "Articles tagged #{params[:tag]}"
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
    @article = Article.published.find_by_id(params[:id]) 
    unless @article
      if @article = Article.find_by_old_url(params[:id])
        redirect_to article_path(@article)
      end
    end
  end
end

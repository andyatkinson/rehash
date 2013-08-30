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
    begin
      @article = Article.published.find(params[:id]) 
    rescue ActiveRecord::RecordNotFound
      if @article = Article.find_by_old_url(params[:id])
        redirect_to article_path(@article)
      end
    end
  end
end

class ApplicationController < ActionController::Base
  helper :all
  protect_from_forgery

  private
    
    def find_article_by_article_id
      @article = Article.find(params[:article_id])
    end
end

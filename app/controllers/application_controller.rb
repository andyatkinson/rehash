class ApplicationController < ActionController::Base
  include SiteHelper
  helper :all
  protect_from_forgery

  filter_parameter_logging :password
  helper_method :admin?, :require_admin
  
  private
    def admin?
      session[:password] == website.hashed_password
    end
    def require_admin
      render :file => "#{RAILS_ROOT}/public/500.html", :status => 401 unless admin?
    end
    def ensure_site_exists
      render :text => "No site found. Site must exist." unless Site.first.present?
    end
    def load_recent_articles
      @recent_articles ||= Article.released.ordered.recent
    end
    def load_recent_comments
      @recent_comments ||= Comment.ordered.recent
    end
    def load_recent_projects
      @recent_projects ||= Project.ordered.recent
    end
    def find_comment_by_id
      
    end
    def find_page_by_id
      @page = Page.find(params[:id])
    end
    def find_project_by_id
      @project = Project.find(params[:id])
    end
    def find_tag_by_id
      @tag = Tag.find(params[:id])
    end
    
    def find_article_by_article_id
      @article = Article.find(params[:article_id])
    end
end
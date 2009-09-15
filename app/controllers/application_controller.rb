class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  filter_parameter_logging :password
  helper_method :admin?, :require_admin
  helper_method :website
  
  private
    def website
      @website ||= Site.first
    end
    def admin?
      session[:password] == website.password
    end
    def require_admin
      render :file => "#{RAILS_ROOT}/public/500.html", :status => 401 unless admin?
    end
    def ensure_site_exists
      if Site.all.empty?
        redirect_to new_site_path
        false
      end
    end
end
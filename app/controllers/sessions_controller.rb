class SessionsController < ApplicationController
  def new
  end
  
  def create
    if Site.authenticate(params[:password])
      session[:password] = website.password
      flash[:notice] = "Successfully logged in"
      redirect_to root_path
    else
      flash.now[:error] = "Error"
      render 'new', :status => :unprocessable_entity
    end
  end

  def destroy
    reset_session
    flash[:notice] = "Successfully logged out"
    redirect_to root_path
  end
end
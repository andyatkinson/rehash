class SitesController < ApplicationController
  def new_contact_form_email
  end
  
  def create_contact_form_email
    if params[:sender_name].blank? || params[:email].blank? || params[:message].blank? || params[:challenge].blank?
      flash[:error] = "All fields are required"
      render 'new_contact_form_email'
    elsif params[:challenge].to_i != 4
      flash[:error] = "Wrong answer to challenge question"
      render 'new_contact_form_email'
    else
      SiteMailer.deliver_contact_form_email(params[:sender_name], params[:email], params[:message])
      flash[:notice] = "Email sent"
      redirect_to root_path
    end
  end
end
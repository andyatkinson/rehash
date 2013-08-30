class ContactFormsController < ApplicationController
  def new
    @contact_form = ContactForm.new
  end
  
  def create
    @contact_form = ContactForm.new(params[:contact_form])
    if @contact_form.valid?
      SiteMailer.contact_form(@contact_form).deliver
      flash[:notice] = "Contact form message sent successfully"
    else
      flash[:error] = "Error sending contact form"
    end
    redirect_to root_path
  end
end

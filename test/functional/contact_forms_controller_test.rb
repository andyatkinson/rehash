require 'test_helper'

class ContactFormsControllerTest < ActionController::TestCase
  test "can render the contact form" do
    @contact_form = Factory.build(:contact_form)
    get :new
  end
  
  test "can post to the contact forms controller with valid data" do
    @contact_form = Factory.attributes_for(:contact_form)
    SiteMailer.stubs(:deliver_contact_form_email).with(@contact_form[:name], @contact_form[:email], @contact_form[:message])
    post :create, :contact_form => @contact_form
    assert_equal "Contact form message sent successfully", flash[:notice]
    assert_redirected_to root_path    
  end

  test "posting invalid contact form data will result in a error message" do
    @contact_form = Factory.attributes_for(:contact_form)
    @contact_form[:name] = ""
    post :create, :contact_form => @contact_form
    assert_equal "Error sending contact form", flash[:error]
    assert_redirected_to root_path
  end
end

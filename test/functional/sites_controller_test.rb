require 'test_helper'

class SitesControllerTest < ActionController::TestCase
  context "new action" do
    should "render new template" do
      get :new
      assert_template 'new'
    end
  end
  
  context "create action" do
    should "render new template when model is invalid" do
      Site.any_instance.stubs(:valid?).returns(false)
      post :create
      assert_template 'new'
    end
    should "redirect when model is valid" do
      post :create, :site => {:name => "MySite", :tagline => "Site tagline", :owner_name => "Owner", :password => "1234"}
      assert_redirected_to edit_site_path(assigns(:site))
    end
  end

  context "With a valid site" do
    setup do
      @site = create_site
      log_in
    end
    context "edit action" do
      should "render edit template" do
        get :edit, :id => @site
        assert_template 'edit'
      end
    end

    context "update action" do
      should "render edit template when model is invalid" do
        Site.any_instance.stubs(:valid?).returns(false)
        put :update, :id => @site
        assert_template 'edit'
      end

      should "redirect when model is valid" do
        put :update, :id => @site, :site => {:name => "MySite", :tagline => "Site tagline", :owner_name => "Owner", :password => "test", :password_confirmation => "test"}
        assert_redirected_to root_path
      end
    end
    
    context "using contact form" do
      should "load contact form for visitors" do
        Site.any_instance.stubs(:valid?).returns(false)
        get :new_contact_form_email
        assert_template 'contact_form_email'
      end
      
      context "posting to contact form new email action" do
        context "with valid data" do
          setup do
            post :create_contact_form_email, :message => "hi", :sender_name => "Sender", :email => "some@email.com", :challenge => "4"
          end
          should_set_the_flash_to /Email sent/i
          # TODO doesn't work should_redirect_to root_path
        end
        context "with invalid challenge question answer" do
          setup do
            post :create_contact_form_email, :message => "hi", :sender_name => "Sender", :email => "some@email.com", :challenge => "3"
          end
          should_set_the_flash_to /Wrong answer to challenge question/i
          should_render_template 'new_contact_form_email'
        end
        context "with invalid data" do
          setup do
            post :create_contact_form_email, :message => "hi", :sender_name => "", :email => "some@email.com", :challenge => "4"
          end
          should_set_the_flash_to /All fields are required/i
          should_render_template 'new_contact_form_email'
        end

      end
    end
  end
end
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
      
      should "allow post to contact form action" do
        Site.any_instance.stubs(:valid?).returns(false)
        get :create_contact_form_email
        assert_response :success
      end
    end
  end
end
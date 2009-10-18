require 'test_helper'

class PagesControllerTest < ActionController::TestCase
  context "a logged in admin" do
    setup do
      create_site
      log_in
    end
    context "index action" do
      should "render index template" do
        get :index
        assert_template 'index'
      end
    end

    context "new action" do
      should "render new template" do
        get :new
        assert_template 'new'
      end
    end

    context "create action" do
      should "render new template when model is invalid" do
        Page.any_instance.stubs(:valid?).returns(false)
        post :create
        assert_template 'new'
      end

      should "redirect when model is valid" do
        Page.any_instance.stubs(:valid?).returns(true)
        post :create, :page => {:name => 'test page', :body => 'body'}
        assert_redirected_to page_url(assigns(:page))
      end
    end
    
    context "a valid page" do
      setup do
        @page = Page.create! :name => "Friendly Name", :body => "Page"
      end
      context "show action" do
        should "render show template" do
          get :show, :id => @page.to_param
          assert_template 'show'
        end
        should "work with page slug in addition to id" do
          get :show, :id => 'friendly-name'  # with friendly_id @page.to_param returns 'friendly-name'
          assert_response :success
          assert_template 'show'
        end
      end
      context "edit action" do
        should "render edit template" do
          get :edit, :id => @page.to_param
          assert_template 'edit'
        end
      end

      context "update action" do
        should "render edit template when model is invalid" do
          Page.any_instance.stubs(:valid?).returns(false)
          put :update, :id => @page.to_param
          assert_template 'edit'
        end

        should "redirect when model is valid" do
          Page.any_instance.stubs(:valid?).returns(true)
          put :update, :id => @page.to_param
          assert_redirected_to page_url(assigns(:page))
        end
      end
      context "destroy action" do
        should "destroy model and redirect to index action" do
          delete :destroy, :id => @page.to_param
          assert_redirected_to pages_url
          assert !Page.exists?(@page)
        end
      end
      
    end  
  end
end
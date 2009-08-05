require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  context "with a valid site" do
    setup do
      @site = create_site
    end
    
    context "login action" do
      should "render login form" do
        get :new
        assert_template 'new'
      end
    end
    
    context "create action" do
      should "create a new session when the correct password is specified" do
        post :create, :password => "1234"
        assert_match /Successfully logged in/, flash[:notice]
        assert_redirected_to root_path
      end
      should "not create a new session when incorrect password is specified" do
        post :create, :password => 'wrong'
        assert_response :unprocessable_entity
        assert_template 'new'
      end
    end
    
    context "with a logged in user" do
      setup do
        log_in
      end
      should "log the user out" do
        delete :destroy
        assert_match /Successfully logged out/, flash[:notice]
        assert_redirected_to root_path
        assert_does_not_contain session, @site.password
      end
    end
    
  end
  
end
require 'test_helper'

class ProjectsControllerTest < ActionController::TestCase
  
  # TODO add this method from other project
  # should_require_login :new, :index
  # should_require_login :create, :method => :post
  # should_require_login :update, :method => :put, :params => { :id => 1 }
  
  context "with a site" do
    setup do
      create_site
    end
    context "index action" do
      should "render index template" do
        get :index
        assert_template 'index'
      end
    end
  end
  
  context "and admin user" do
    setup do
      create_site
      log_in
    end

    context "new action" do
      should "render new template" do
        get :new
        assert_template 'new'
      end
    end
    
    context "create action" do
       should "render new template when model is invalid" do
         Project.any_instance.stubs(:valid?).returns(false)
         post :create
         assert_template 'new'
       end
     end
    
    
    context "and a valid project" do
      setup do
        @project = Project.create! :name => "name", :description => "desc", 
          :duration => "2 months", :role => "role", :url => "http://google.com"
      end
      should "redirect when model is valid" do
        post :create, :project => @project.attributes
        assert_redirected_to projects_path
      end
      
        context "show action" do
             should "render show template" do
               get :show, :id => @project.id
               assert_template 'show'
             end
           end
          
           context "edit action" do
            should "render edit template" do
              get :edit, :id => @project.id
              assert_template 'edit'
            end
          end
           
           context "update action" do
            should "render edit template when model is invalid" do
              Project.any_instance.stubs(:valid?).returns(false)
              put :update, :id => @project.id
              assert_template 'edit'
            end
           
            should "redirect when model is valid" do
              Project.any_instance.stubs(:valid?).returns(true)
              put :update, :id => @project.id
              assert_redirected_to projects_path
            end
          end
   
      end

    end

end
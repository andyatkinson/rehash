require 'test_helper'

class ArticlesControllerTest < ActionController::TestCase
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
         Article.any_instance.stubs(:valid?).returns(false)
         post :create
         assert_template 'new'
       end
     end
    
    
    context "and a valid article" do
      setup do
        @article = Article.create! :title => "title", :body => "body"
      end
      should "redirect when model is valid" do
        post :create, :article => @article.attributes
        assert_redirected_to article_url(assigns(:article))
      end
      
        context "show action" do
             should "render show template" do
               get :show, :id => @article.id
               assert_template 'show'
             end
           end
          
           context "edit action" do
            should "render edit template" do
              get :edit, :id => @article.id
              assert_template 'edit'
            end
          end
           
           context "update action" do
            should "render edit template when model is invalid" do
              Article.any_instance.stubs(:valid?).returns(false)
              put :update, :id => @article.id
              assert_template 'edit'
            end
           
            should "redirect when model is valid" do
              Article.any_instance.stubs(:valid?).returns(true)
              put :update, :id => @article.id
              assert_redirected_to article_url(assigns(:article))
            end
          end
   
       context "destroy action" do
         should "destroy model and redirect to index action" do
           delete :destroy, :id => @article.id
           assert_redirected_to articles_url
           assert !Article.exists?(@article.id)
         end
       end
      end

    end

end

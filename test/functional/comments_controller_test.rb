require 'test_helper'

class CommentsControllerTest < ActionController::TestCase
  context "With a logged in admin" do
    setup do
      create_site
      log_in
    end
    context "and a valid article" do
      setup do
        @article = Article.create! :title => "title", :body => "body"
      end
      context "index action" do
        should "render index template" do
          get :index, :article_id => @article.id
          assert_template 'index'
        end
      end

      context "new action" do
        should "render new template" do
          get :new, :article_id => @article.id
          assert_template 'new'
        end
      end

      context "create action" do
        should "render new template when model is invalid" do
          Comment.any_instance.stubs(:valid?).returns(false)
          post :create, :article_id => @article.id, :comment => {:body => "body"}
          assert_template 'new'
        end

        should "redirect when model is valid" do
          Comment.any_instance.stubs(:valid?).returns(true)
          post :create, :article_id => @article.id, :comment => {:body => "body"}
          assert_response :redirect
          assert_redirected_to article_path(assigns(:comment).article)
        end
      end

      context "and a valid comment" do
        setup do
          @comment = @article.comments.create! :name => "name", :body => "body", :email => "email@email.com"
        end

        context "edit action" do
          should "render edit template" do
            get :edit, :article_id => @article.id, :id => @comment
            assert_template 'edit'
          end
        end

        context "update action" do
          should "render edit template when model is invalid" do
            Comment.any_instance.stubs(:valid?).returns(false)
            put :update, :article_id => @article.id, :id => @comment
            assert_template 'edit'
          end

          should "redirect when model is valid" do
            Comment.any_instance.stubs(:valid?).returns(true)
            put :update, :article_id => @article.id, :id => @comment
            assert_response :redirect
            assert_redirected_to comments_path
          end
        end

        context "destroy action" do
          should "destroy model and redirect to index action" do
            delete :destroy, :article_id => @article.id, :id => @comment
            assert_redirected_to article_comments_url(@article)
            assert !Comment.exists?(@comment)
          end
        end
      end
    end
  end
end
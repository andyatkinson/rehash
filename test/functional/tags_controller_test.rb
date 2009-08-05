require 'test_helper'

class TagsControllerTest < ActionController::TestCase
  context "A logged in admin" do
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
        Tag.any_instance.stubs(:valid?).returns(false)
        post :create
        assert_template 'new'
      end

      should "redirect when model is valid" do
        Tag.any_instance.stubs(:valid?).returns(true)
        post :create
        assert_redirected_to tag_url(assigns(:tag))
      end
    end

    context "with a valid tag" do
      setup do
        @tag = Tag.create! :name => "Minneapolis"
      end

      context "update action" do
        should "render edit template when model is invalid" do
          Tag.any_instance.stubs(:valid?).returns(false)
          put :update, :id => @tag
          assert_template 'edit'
        end
      end

      should "redirect when model is valid" do
        Tag.any_instance.stubs(:valid?).returns(true)
        put :update, :id => @tag
        assert_redirected_to @tag
      end

      context "show action" do
        should "render show template" do
          get :show, :id => @tag
          assert_template 'show'
        end
      end
      context "edit action" do
        should "render edit template" do
          get :edit, :id => @tag
          assert_template 'edit'
        end
      end

      context "destroy action" do
        should "destroy model and redirect to index action" do
          delete :destroy, :id => @tag
          assert_redirected_to tags_url
          assert !Tag.exists?(@tag)
        end
      end
    end
  end
end
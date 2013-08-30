require 'test_helper'

class ArticlesControllerTest < ActionController::TestCase
  test "articles can be displayed in a list" do
    @article = Factory(:article)
    get :index
    assert_response :ok
    assert_template :index
    assert assigns(:articles).include?(@article)
  end
  
  test "the article show template works" do
    @article = Factory(:article)
    get :show, :id => @article.to_param
    assert_template :show
    assert_response :ok
    assert_equal @article, assigns(:article)
  end
  
  test "unpublished articles should not be displayed" do
    @article = Factory(:article, published: false, published_on: nil)
    get :index
    assert_response :ok
    assert !assigns(:articles).include?(@article)
  end

  test "can find articles by a tag" do
    @article = Factory(:article, tag_list: "Fun")
    get :index, tag: "Fun"
    assert assigns(:articles).include?(@article)
    assert_equal "Articles tagged Fun", flash[:notice]
  end

  test "can get a feed of articles" do
    @article = Factory(:article)
    get :index, :format => :atom
    assert assigns(:articles)  
    assert_template :index
  end

  test "can find an article by the old URL" do
    @article = Factory(:article, title: "Working with data")
    get :show, :id => "working-with-data"
    assert_redirected_to article_path(@article)
  end
end

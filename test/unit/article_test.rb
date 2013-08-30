require 'test_helper'

class ArticleTest < ActiveSupport::TestCase
  test "the factory object is a valid instance" do
    @article = Factory.build(:article)
    assert @article.valid?
  end  
  
  test "an article can store a list of tags" do
    @article = Factory(:article)
    @article.update_attribute(:tag_list, "foo, bar, baz")
    assert_equal "foo bar baz", @article.tag_list
  end 
  
  test "an article should have a to_param representation" do
    @article = Factory.build(:article, id: 1, title: "Cool blog post")
    assert_equal "1-cool-blog-post", @article.to_param
  end

  test "an article can accept comments if published less than 12 months ago" do
    @article = Factory.build(:article, published: true, published_on: 6.months.ago)
    assert @article.can_accept_comments?
  end  

  test "an article can not accept comments if it was published more than 12 months ago" do
    @article = Factory.build(:article, published: true, published_on: 13.months.ago)
    assert !@article.can_accept_comments?
  end

  test "can find an article with the old URL format" do
    @article = Factory(:article, title: "Working with large amounts of data")
    old_url = "working-with-large-amounts-of-data"
    assert_equal @article, Article.find_by_old_url(old_url)
  end
end

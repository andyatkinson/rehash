require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  test "factory instance of comment is valid" do
    @comment = Factory(:comment)
    assert @comment.valid?
  end
  
  test "an article that is not published does not allow comments" do
    @article = Factory(:article)
    @article.published = false
    @article.published_on = nil
    @comment = Factory.build(:comment, article: @article)
    assert !@comment.valid?
    assert @comment.errors[:article_id].include?("must be published")  
  end

  test "need to submit correct challenge for basic spam prevention" do
    @article = Factory(:article)
    @comment = Factory.build(:comment, article: @article, challenge: 2)
    assert !@comment.valid?
    assert @comment.errors[:challenge].include?("is incorrect")
  end
end

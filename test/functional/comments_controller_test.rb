require 'test_helper'
require 'digest/md5'

class CommentsControllerTest < ActionController::TestCase
  test "can create a comment on an article" do
    @article = Factory(:article)
    @comment_attributes = Factory.attributes_for(:comment)
    post :create, article_id: @article.id, comment: @comment_attributes
    assert_redirected_to @article
    assert_equal "Comment saved", flash[:notice]
    assert cookies['comment']
    assert /[a-z0-9]{10}/ =~ cookies['comment']
    assert expires_on = response.headers["Set-Cookie"].scan(/expires\=(.*)/)[0][0]
    assert DateTime.parse(expires_on) < 10.minutes.from_now
    # probably should disable commenting on front-end unless cookies are enabled
    # TODO use signed cookies? 
  end

  test "posting an invalid comment will render the new form" do
    @article = Factory(:article)
    @comment_attributes = {}
    post :create, article_id: @article.id, comment: @comment_attributes
    assert_template :new
    assert_equal "Error saving comment", flash[:error]
  end
  
  test "can update a comment on an an article if user is the author of the comment" do
    unique_identifier = SecureRandom.hex(5) 
    @request.cookies['comment'] = unique_identifier 
    @comment = Factory(:comment)
    session[@comment.id] = unique_identifier
    @comment.body = "cool article"
    put :update, :article_id => @comment.article_id, :id => @comment.id, :comment => {:body => @comment.body}
    assert_equal "Comment saved", flash[:notice]
    assert_redirected_to @comment.article
  end
  
  test "can NOT update a comment on an an article if the user is NOT the author of the comment" do
    unique_identifier = SecureRandom.hex(5) 
    @request.cookies['comment'] = unique_identifier
    @comment = Factory(:comment)
    session[@comment.id] = nil
    @comment.body = "cool article"
    put :update, :article_id => @comment.article_id, :id => @comment.id, :comment => {:body => @comment.body}
    assert_equal " ", @response.body
    assert @response.status == 404
  end

   test "can remove a comment on an article when it is the author and the editing period has not expired" do
    @article = Factory(:article)
    unique_identifier = SecureRandom.hex(5) 
    @request.cookies['comment'] = unique_identifier
    @comment = Factory(:comment, article: @article)
    session[@comment.id] = unique_identifier
    delete :destroy, :article_id => @comment.article_id, :id => @comment.id
    assert_redirected_to @article
    assert @article.comments.empty?
    assert_equal "Comment removed", flash[:notice]
  end
end

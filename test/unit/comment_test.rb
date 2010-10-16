require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  context "with a valid article" do
   setup do
      @article = Article.create! :title => "title", :body => "body"
      Comment.any_instance.stubs(:article).returns(@article)
    end
    should validate_presence_of(:name)
    should validate_presence_of(:body)
    should validate_presence_of(:email)
    should validate_presence_of(:challenge)
    should validate_presence_of(:article_id)
    should belong_to :article
    should_not allow_value(["foo", "foo@com"]).for(:email)
    should allow_value("foo@company.com").for(:email) 
  end
  
end

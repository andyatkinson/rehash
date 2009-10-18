require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  context "with a valid article" do
   setup do
      @article = Article.create! :title => "title", :body => "body"
      Comment.any_instance.stubs(:article).returns(@article)
    end
    should_validate_presence_of :name, :body, :email, :challenge, :article_id
    should_belong_to :article
    should_not_allow_values_for :email, "foo", "foo@com"
    should_allow_values_for :email, "foo@company.com"
  end
  
end

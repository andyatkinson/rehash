require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  should_validate_presence_of :name, :body, :email
  should_belong_to :article
  should_not_allow_values_for :email, "foo", "foo@com"
  should_allow_values_for :email, "foo@company.com"
end

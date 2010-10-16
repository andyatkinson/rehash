require 'test_helper'

class ArticleTest < ActiveSupport::TestCase
  should validate_presence_of :title
  should validate_presence_of :body
  should have_many :comments
  should have_many :tags
  should allow_value([false, true]).for(:published)
  # TODO test for friendly_id
  # TODO test for published_on
end
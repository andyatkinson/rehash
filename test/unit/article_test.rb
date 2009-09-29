require 'test_helper'

class ArticleTest < ActiveSupport::TestCase
  should_validate_presence_of :title, :body
  should_have_many :comments, :tags
  should_allow_values_for :published, false, true
  # TODO test for friendly_id
end
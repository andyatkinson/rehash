require 'test_helper'

class PageTest < ActiveSupport::TestCase
  context 'A page' do
    should_validate_presence_of :name, :body
    should_allow_values_for :published, false, true
  end
end

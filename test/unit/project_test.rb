require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
  context 'A project' do
    should_validate_presence_of :name, :description, :role, :duration, :url
    should_allow_values_for :url, "http://google.com", "https://secure.company.net"
    should_have_many :uploads
    # TODO test for friendly_id
  end
end

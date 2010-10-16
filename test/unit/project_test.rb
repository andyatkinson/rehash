require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
  context 'A project' do
    should validate_presence_of(:name)
    should validate_presence_of(:description)
    should validate_presence_of(:role)
    should validate_presence_of(:duration)
    should validate_presence_of(:url)
    should allow_value("http://google.com").for(:url)
    should allow_value("https://secure.company.net").for(:url)
    should have_many(:uploads)
    # TODO test for friendly_id
  end
end

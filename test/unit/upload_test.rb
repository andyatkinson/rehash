require 'test_helper'

class UploadTest < ActiveSupport::TestCase
  context "An upload" do
    should_belong_to :attachable
  end
end

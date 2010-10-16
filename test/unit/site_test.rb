require 'test_helper'

class SiteTest < ActiveSupport::TestCase
  should validate_presence_of(:name)
  should validate_presence_of(:tagline)
  should validate_presence_of(:owner_name)
  should validate_presence_of(:password)
  should_not allow_value("foo").for(:owner_email)
  should_not allow_value("foo@com").for(:owner_email)
  should allow_value("foo@company.com").for(:owner_email)
  context "A valid site" do    
    context "with some tags created" do
      setup do
        %w(foo bar baz).each {|t| Tag.create! :name => t}
      end
      should "have some default tags" do
        assert_contains %w(foo bar baz).join(', '), Site.new.default_tags
      end
    end
  end
end

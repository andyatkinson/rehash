require 'test_helper'

class SiteTest < ActiveSupport::TestCase
  should_validate_presence_of :name, :tagline, :owner_name, :password
  should_not_allow_values_for :owner_email, "foo", "foo@com"
  should_allow_values_for :owner_email, "foo@company.com"
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

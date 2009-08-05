require 'test_helper'

class SiteTest < ActiveSupport::TestCase
  context "A valid site" do
    should_validate_presence_of :name, :tagline, :owner_name, :password
    
    context "with some tags created" do
      setup do
        %w(foo bar baz).each {|t| Tag.create! :name => t}
      end
      should "have some default tags" do
        assert_contains %w(foo bar baz).join(','), Site.new.default_tags
      end
    end
    
  end
  test "need a valid email for site" do
    attrs = {:name => "name", :tagline => "tagline", :owner_name => "name", :password => "pass", :owner_email => "foo"}
    site = Site.create attrs
    assert !site.valid?
    assert 1, site.errors.size
    assert_match /must be a valid email address/, site.errors[:owner_email]
  end
end

require 'test_helper'

class PageTest < ActiveSupport::TestCase
  context 'A page' do
    should_validate_presence_of :name, :body
    should_allow_values_for :published, false, true

    should "now allow names from reserved words" do
      @page = Page.new(:name => 'contact', :body => "body")
      assert !@page.valid?
      @page.save
      assert @page.errors[:base], "Page name may not be a reserved word"
    end
  end
end

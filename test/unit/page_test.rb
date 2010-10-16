require 'test_helper'

class PageTest < ActiveSupport::TestCase
  context 'A page' do
    should validate_presence_of :name
    should validate_presence_of :body
    should allow_value([false, true]).for(:published) 

    should "now allow names from reserved words" do
      @page = Page.new(:name => 'contact', :body => "body")
      assert !@page.valid?
      @page.save
      assert @page.errors[:base], "Page name may not be a reserved word"
    end
  end
end

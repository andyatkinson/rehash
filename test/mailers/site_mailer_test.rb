require 'test_helper'

class SiteMailerTest < ActionMailer::TestCase
  tests SiteMailer
  test "contact form email" do
    @contact_form = Factory.build(:contact_form)
    email = SiteMailer.contact_form(@contact_form).deliver

    assert !ActionMailer::Base.deliveries.empty?
    
    assert_equal [@contact_form.email], email.from
    assert_equal [WEBSITE_CONFIG['owner_email']], email.to
    assert_equal "Contact form email from #{@contact_form.name}", email.subject
    
  end
end

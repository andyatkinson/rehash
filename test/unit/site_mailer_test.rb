require 'test_helper'

class SiteMailerTest < ActionMailer::TestCase
  
  # TODO 10/22/2009 not finding the erb template from the test
  #
  # def test_contact_form_email
  #   name, email, message = "name", "email@company.com", "message"
  #   email = SiteMailer.deliver_contact_form_email(Site.new, name, email, message)
  #   assert !ActionMailer::Base.deliveries.empty?
  # 
  #   # Test the body of the sent email contains what we expect it to
  #   assert_equal email, email.to
  #   assert_match /message/, email.body
  # end
end

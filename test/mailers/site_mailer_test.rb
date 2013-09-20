require 'test_helper'

class SiteMailerTest < ActionMailer::TestCase
  tests SiteMailer
  test "contact form email" do
    @contact_form = Factory.build(:contact_form)
    email = SiteMailer.contact_form(@contact_form).deliver

    assert !ActionMailer::Base.deliveries.empty?
    
    assert_equal [@contact_form.email], email.from
    assert_equal [ENV['OWNER_EMAIL']], email.to
    assert_equal "Contact form email from #{@contact_form.name}", email.subject
    assert_equal "Getting in touch with you", @contact_form.message 
  end

  test "new comment notification to site owner email" do
    @comment = Factory.build(:comment)
    email = SiteMailer.comment_email(@comment).deliver

    assert !ActionMailer::Base.deliveries.empty?
    assert_equal [@comment.email], email.from
    assert_equal [ENV['OWNER_EMAIL']], email.to
    assert_equal "New comment on article: #{@comment.article.title}", email.subject
    assert_equal "That was an interesting article!", @comment.body
  end
end

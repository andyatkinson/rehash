class SiteMailer < ActionMailer::Base
  include SiteHelper
  
  # Send an email to the site owner from the website contact form
  def contact_form_email(name, email, message)
    recipients website.owner_email
    from  email
    subject "#{website.name} Contact form Email from #{name}"
    sent_on Time.now
    body  :message => message
  end
  
  # Send an email to the site owner when a comment is created
  def comment_email(comment)
    recipients website.owner_email
    from  comment.email
    subject "New comment on #{comment.article.title}"
    sent_on Time.now
    body  :message => comment.body, :from => comment.name
  end
end

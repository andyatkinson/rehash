class SiteMailer < ActionMailer::Base
  
  def contact_form(contact_form)
    @message = contact_form.message
    mail(to: WEBSITE_CONFIG['owner_email'], from: contact_form.email, 
      subject: "Contact form email from #{contact_form.name}")
  end
  
  def comment_email(comment)
    @message = comment.body
    mail(to: WEBSITE_CONFIG['owner_email'], from: comment.email,
      subject: "New comment on #{comment.article.title}")
  end
end

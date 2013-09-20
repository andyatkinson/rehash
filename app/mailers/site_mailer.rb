class SiteMailer < ActionMailer::Base
  
  def contact_form(contact_form)
    mail(to: WEBSITE_CONFIG['owner_email'], from: contact_form.email, 
      subject: "Contact form email from #{contact_form.name}",
      body: contact_form.message,
      content_type: "text/plain")
  end
  
  def comment_email(comment)
    mail(to: WEBSITE_CONFIG['owner_email'], from: comment.email,
      subject: "New comment on article: #{comment.article.title}",
      body: comment.body,
      content_type: "text/plain")
  end
end

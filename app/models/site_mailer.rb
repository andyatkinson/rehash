class SiteMailer < ActionMailer::Base
  
  def contact_form_email(website, name, email, message)
    recipients website.owner_email
    from  email
    subject "Contact form email for #{website.name} from #{name}"
    sent_on Time.now
    body  :message => message
  end
end

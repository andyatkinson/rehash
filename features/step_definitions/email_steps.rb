Then /^the site owner should receive an email$/ do
  assert !ActionMailer::Base.deliveries.empty?
end
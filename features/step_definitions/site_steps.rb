Given /^I have no site$/ do
  Site.destroy_all
end

Given /^I have a site "([^\"]*)"$/ do |name|
  Site.create! :name => name, :tagline => "Site tagline", :owner_name => "Owner", :password => "1234"
end
Given /^I have no site$/ do
  Site.destroy_all
end

Given /^I have a site "([^\"]*)"$/ do |name|
  Site.create! :name => name, :tagline => "Site tagline", :owner_name => "Owner", :password => '1234', :password_confirmation => '1234'
end

When /^I choose a new theme$/ do
  visit change_theme_site_path(:theme_name => 'basic')
end

When /^I log out$/ do
  visit logout_path
end

When /^I visit the login page$/ do
  visit login_path
end

Then /^I should have (.+) (.+)$/ do |number, model|
  assert_equal number.to_i, model.singularize.capitalize.constantize.count
end

Given /^the admin is logged in$/ do
  visit login_path
  fill_in(:password, :with => '1234')
  click_button 'Login'
end

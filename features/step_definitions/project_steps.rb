Given /^I have no projects$/ do
  Project.destroy_all
end

Given /^I have projects "([^\"]*)"$/ do |names|
  names.split(',').each{|name| Project.create! :name => name, :description => "desc", 
    :duration => "2 months", :role => "role", :url => "http://google.com" }
end

When /^I go to project "([^\"]*)"$/ do |name|
  p = Project.find_by_name(name)
  visit edit_project_path(p)
end

Given /^I have no uploads$/ do
  Upload.destroy_all
end

When /^I attach a file onto "([^\"]*)"$/ do |field|
  attach_file(field, File.join(RAILS_ROOT, 'public', 'images', 'segovia.jpg'))
end
Given /^I have articles titled (.+)$/ do |titles|
  Article.delete_all
  titles.split(', ').each do |title|
    Article.create! :title => title, :body => "some text", :description => "description", :published => true
  end
end

Given /^I have no articles$/ do
  Article.delete_all
end

Given /^the following articles$/ do |table|
  table.hashes.each do |t|
    Article.create! :title => t[:title], :body => t[:body]
  end
end

When /^I delete the article (.+)$/ do |title|
  article = Article.find_by_title(title)
  click_link "delete_article_#{article.id}"
end

Given /^I have unpublished articles titled (.+)$/ do |title|
  Article.create! :title => title, :body => "some text"
end

Then /^the article (.+) should not be found$/ do |title|
  assert_raises RuntimeError do
    visit path_to(Article.find_by_title(title))
  end
end

Then /^I should see the site title$/ do
  response.should contain(Site.first.name) 
end

Given /^I have unpublished articles "([^\"]*)"$/ do |title|
  Article.create! :title => title, :body => "body", :published => false
end
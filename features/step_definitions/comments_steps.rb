Given /^I have a comment from "([^\"]*)" for the article "([^\"]*)"$/ do |author_name, article_title|
  a = Article.find_or_create_by_title(article_title)
  a.comments.create! :name => author_name, :body => "body", :email => "email@email.com"
end

When /^I delete the comment from "([^\"]*)"$/ do |name|
  comment = Comment.find_by_name(name)
  click_link "delete_comment_#{comment.id}"
end

When /^I edit the comment from "([^\"]*)"$/ do |name|
  comment = Comment.find_by_name(name)
  click_link "edit_comment_#{comment.id}"
end
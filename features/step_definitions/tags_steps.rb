Given /^I have tags (.+)$/ do |names|
  names.split(', ').each do |name|
    Tag.create! :name => name
  end
end

Given /^I have articles with tag (.+) titled (.+)$/ do |tag_name, article_title|
  a = Article.create! :title => article_title, :body => "body", :published => true
  a.tag_list = [tag_name]
  a.save!
end

Then /^article (.+) should have (\d) tags?$/ do |title, count|
  a = Article.find_by_title(title)
  assert count, a.tag_list.size
end

Then /^I check tag (.+)$/ do |name|
  tag = Tag.find_by_name(name)
  field = "check_tag_#{tag.id}"
  check(field)
end

When /^I delete the tag (.+)$/ do |name|
  tag = Tag.find_by_name(name)
  click_link "delete_tag_#{tag.id}"
end

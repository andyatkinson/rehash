module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in webrat_steps.rb
  #
  def path_to(page_name)
    case page_name
    
    when /the homepage/
      root_path
    when /the list of projects/
      projects_path
    when /the new project page/
      new_project_path
    when /the list of articles/
      articles_path
    when /the article titled (.+)/
      article_path(Article.find_by_title($1))
    when /the comment from "([^\"]*)"/
      c = Comment.find_by_name($1)
      article_comment_path(c.article, c)
    when /the list of comments for "([^\"]*)"/
      a = Article.find_by_title($1)
      article_comments_path(a)
    when /the list of comments/
      comments_path
    when /the list of tags/
      tags_path
    when /the tag (.+)/
      tag_path(Tag.find_by_name($1))
    when /the logout path/
      logout_path
    when /$the login path^/
      login_path
    when /the feed/
      feed_path
    when /the list of pages/
      pages_path
    when /the page (.+)/
      page = Page.find_by_name($1)
      page_path(page)
    when /the home page/
      root_path
    
    # Add more mappings here.
    # Here is a more fancy example:
    #
    #   when /^(.*)'s profile page$/i
    #     user_profile_path(User.find_by_login($1))

    else
      raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
        "Now, go and add a mapping in #{__FILE__}"
    end
  end
end

World(NavigationHelpers)

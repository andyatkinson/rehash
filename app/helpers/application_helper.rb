# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  include SiteHelper

  def tag_links_for_article(article)
    links = []
    article.tags.each do |tag|
      links << content_tag(:li, link_to(tag.name, tagged_articles_path(:tag => tag.name), :title => "Search articles tagged #{tag}"))
    end
    "<ul>#{links.join}</ul>"
  end
  
  def article_eligible_for_comments?(article)
    article.published? && (Time.now < (article.created_at + 3.months))
  end
  
  def admin_comment?(comment)
    return true if comment.email == website.owner_email
  end
  
  def open_id_meta_tags
    return "" if website.open_id_server.blank? || website.open_id_delegate.blank?
    "<link rel='openid.server' href='http://#{website.open_id_server}' />\n" +
      "<link rel='openid.delegate' href='http://#{website.open_id_delegate}' />"
  end
  
  def article_metadata(article)
    html = ""
    html << "Written by #{link_to website.owner_name, contact_path}"
    html << " on #{article.published_on}" if article.published?
    html << ' ' << link_to(pluralize(article.comments.count, 'comment'), "#{article_path(article)}#comments") if article.comments.any?
    html << "<br/>Tagged #{article.tag_list}" unless article.tag_list.blank?
    html
  end
  
  def truncated_project_description(project)
    html = truncate(project.description.gsub(/<\/?[^>]*>/,  ""), 100)
    html += link_to " Read full project description &rarr;", project
    html
  end
  
  def project_image_url(project)
    return "" if project.uploads.blank?
    project.uploads.first.data.url(:square)
  end
end

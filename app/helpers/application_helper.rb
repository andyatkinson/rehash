# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  include SiteHelper

  def tag_links_for_article(article)
    links = []
    article.tags.each do |tag|
      links << content_tag(:li, link_to(tag.name, tagged_articles_path(:tag => tag.name)))
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
end

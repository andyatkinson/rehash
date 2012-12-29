require 'syntax/convertors/html'

module ApplicationHelper
  include SiteHelper
  
  def article_eligible_for_comments?(article)
    article.published? && (Time.now < (article.created_at + 3.months))
  end
  
  def article_metadata(article)
    html = ""
    html << "Written by #{link_to website.owner_name, contact_path}"
    html << " on #{article.published_on}" if article.published?
    html << ' ' << link_to(pluralize(article.comments.count, 'comment'), "#{article_path(article)}#comments") if article.comments.any?
    html << "<br/><span>Tagged</span> #{article.tag_list}" unless article.tag_list.blank?
    html
  end
  
  def project_image_url(project)
    return "" if project.uploads.blank?
    project.uploads.first.data.url(:square)
  end
  
  def highlight(text)
    h = Hpricot(text)
    c = Syntax::Convertors::HTML.for_syntax "ruby"
    h.search('//pre') do |e|
      e.set_attribute 'class', 'code'
      e.inner_html = c.convert(e.inner_text, false)
    end
    h.to_s
  end
end
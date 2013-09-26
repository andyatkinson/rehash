require 'syntax/convertors/html'

module ApplicationHelper
  
  def highlight(text)
    h = Hpricot(text)
    c = Syntax::Convertors::HTML.for_syntax "ruby"
    h.search('//pre') do |e|
      e.set_attribute 'class', 'code'
      e.inner_html = c.convert(e.inner_text, false)
    end
    h.to_s
  end

  def show_comment_edit_links?(comment)
    cookies['comment'] && session[comment.id] && session[comment.id] == cookies['comment']
  end

  def comments_link_for_article(article)
    return unless article.comments.any?
    raw "&mdash; #{link_to(pluralize(article.comments.count, "comment"), "#{article_path(article)}#comments")}"
  end

  def tag_links(article)
    article.tags.map(&:name).map{|t| link_to t, "/articles/tags/#{t}" }.join(', ')
  end

  def article_header_tags(article)
    return unless article.tags.any?
    raw "&mdash; Tagged: #{tag_links(article)}"
  end

  def article_footer_tags(article)
    return unless article.tags.any?
    raw tag_links(article)
  end
end

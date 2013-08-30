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
end

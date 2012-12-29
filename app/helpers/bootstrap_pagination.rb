class BootstrapPagination < WillPaginate::LinkRenderer
   def to_html
    links = @options[:page_links] ? windowed_links : []

    html = links.join(@options[:separator])
    @options[:container] ? @template.content_tag(:ul, html, html_attributes) : html
  end

protected

  def windowed_links
    visible_page_numbers.map { |n| page_link_or_span(n, (n == current_page ? 'current' : nil)) }
  end

  def page_link_or_span(page, span_class, text = nil)
    text ||= page.to_s
    page_link(page, text, :class => span_class)
  end

  def page_link(page, text, attributes = {})
    @template.content_tag(:li, @template.link_to(text, url_for(page)), attributes)
  end

  def page_span(page, text, attributes = {})
    @template.content_tag(:li, text, attributes)
  end

end
module LayoutHelper
  def title(article_title)
    content_for(:title) {
      parts = []
      parts << WEBSITE_CONFIG['title']
      parts << article_title if article_title.present?
      parts.join(' - ')
    }
  end
  
  def meta_description(desc)
    content_for(:meta_description) {desc}
  end
  
  def meta_keywords(keywords)
    content_for(:meta_keywords) {keywords}
  end
   
  def stylesheet(*args)
    content_for(:head) { stylesheet_link_tag(*args.map(&:to_s)) }
  end
  
  def javascript(*args)
    args = args.map { |arg| arg == :defaults ? arg : arg.to_s }
    content_for(:head) { javascript_include_tag(*args) }
  end
end

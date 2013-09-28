module LayoutHelper
  def title(article_title)
    content_for(:title) {
      parts = []
      parts << ENV['TITLE']
      parts << article_title if article_title.present?
      parts.compact.join(' - ')
    }
  end
  
  def meta_description(desc = "")
    content_for(:meta_description) {desc.to_s + ENV['META_DESCRIPTION'].to_s}
  end
  
  def meta_keywords(keywords = "")
    words = keywords.split(",") + ENV['META_KEYWORDS'].to_s.split(",").map(&:strip)
    content_for(:meta_keywords){ words.join(", ") }
  end
end

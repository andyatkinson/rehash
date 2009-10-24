# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  include SiteHelper

  def tag_links_for_article(article)
    links = []
    article.tags.each do |tag|
      links << link_to(tag.name, tagged_articles_path(:tag => tag.name))
    end
    links
  end
  
  def article_eligible_for_comments?(article)
    article.published? && (Time.now < (article.created_at + 3.months))
  end
end

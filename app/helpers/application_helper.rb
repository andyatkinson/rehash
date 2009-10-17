# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  
  def tag_links_for_article(article)
    links = []
    article.tags.each do |tag|
      links << link_to(tag.name, tagged_articles_path(:tag => tag.name))
    end
    links
  end
  
end

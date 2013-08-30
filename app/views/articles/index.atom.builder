xml.instruct!
xml.feed "xmlns" => "http://www.w3.org/2005/Atom" do
  xml.title  WEBSITE_CONFIG['title'] 
  xml.link    "rel" => "self", "href" => articles_url
  xml.id      articles_url
  xml.updated @articles.first.updated_at.strftime "%Y-%m-%dT%H:%M:%SZ" if @articles.any?
  xml.author  { xml.name WEBSITE_CONFIG['owner_name'] }

  @articles.each do |article|
    xml.entry do
      xml.title   article.title
      xml.link    "rel" => "alternate", "href" => article_url(article)
      xml.id      article_url(article)
      xml.updated article.updated_at.strftime "%Y-%m-%dT%H:%M:%SZ"
      xml.author  { xml.name WEBSITE_CONFIG['owner_name'] }
      xml.summary article.body
    end
  end
end

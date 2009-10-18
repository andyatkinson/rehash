atom_feed do |feed|
  feed.title(h(website.name))
  Article.first.nil? ? Time.now : feed.updated(Article.first.updated_at)
  
  @articles.each do |article|
    feed.entry(article) do |entry|
      entry.title article.title
      entry.content(article.body, :type => 'html')
    end
  end
end
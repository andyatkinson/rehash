atom_feed do |feed|
  feed.title(h(website.name))
  feed.updated(Article.first.updated_at || Time.now)
  
  @articles.each do |article|
    feed.entry(article) do |entry|
      entry.title article.title
      entry.content(article.body, :type => 'html')
    end
  end
end
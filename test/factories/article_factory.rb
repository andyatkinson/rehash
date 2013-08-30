Factory.define :article do |f|
  f.title "Cool title"
  f.description "cool description"
  f.body "body text"
  f.published true
  f.created_at DateTime.now
  f.updated_at DateTime.now
  f.published_on DateTime.now
end

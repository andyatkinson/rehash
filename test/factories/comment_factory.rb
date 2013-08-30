Factory.define :comment do |f|
  f.association :article
  f.name "Bob Jones"
  f.email "bob@example.com"
  f.body "That was an interesting article!" 
  f.challenge 4
end

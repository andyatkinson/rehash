class Article < ActiveRecord::Base
  validates_presence_of :title, :body
  has_many :comments
  acts_as_taggable
  acts_as_markdown :body
  has_friendly_id :title, :use_slug => true
  named_scope :released, :conditions => {:published => true}
  
  def self.search(search)
    search.blank? ? [] : released.find(:all, :conditions => ['title LIKE ?', "%#{search}%"])
  end
end

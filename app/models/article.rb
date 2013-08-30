class Article < ActiveRecord::Base
  validates_presence_of :title, :body
  has_many :comments
  has_many :taggings
  has_many :tags, through: :taggings
  acts_as_markdown :body

  scope :published, where(published: true).order('published_on DESC') 
  
  def self.tagged_with(name)
    Tag.find_by_name!(name).articles
  end
  
  def tag_list
    tags.map(&:name).join(' ')
  end

  def tag_list=(names)
    self.tags = names.split(",").map do |name|
      Tag.where(name: name.strip).first_or_create!
    end 
  end
  
  def to_param
    "#{id}-#{title.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')}"
  end
  
  def can_accept_comments?
    # TODO check in JS or via redirect whether coookies are enabled
    @article_is_eligible ||= published? && DateTime.now < published_on + 12.months 
  end

  def self.find_by_old_url(url)
    Article.where("title LIKE (?)", url.split("-").join(" ")).first
  end
end


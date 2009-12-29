class Comment < ActiveRecord::Base
  include SiteHelper
  belongs_to :article
  validates_associated :article
  validates_presence_of :name, :body, :email, :article_id
  validates_presence_of :challenge, :on => :create
  validates_format_of :email, :with => Site::EMAIL_REGEX
  validate :article_must_be_published_and_eligible, :correct_challenge_answer
  after_save :email_site_owner
  is_gravtastic :email, :size => 50
  named_scope :recent, :limit => 5
  named_scope :ordered, :order => 'created_at DESC'
  
  attr_accessor :challenge
  
  private
    def article_must_be_published_and_eligible
      errors.add_to_base("Article must be published") unless article.published?
      errors.add_to_base("Commenting closed article older than 3 months") if article.created_at > (Time.now + 3.months)
    end
    def correct_challenge_answer
      return true if !self.new_record? # don't care about update
      errors.add_to_base("Challenge answer incorrect") if challenge.to_i != 4
    end
    def email_site_owner
      SiteMailer.deliver_comment_email(self)
    end
end
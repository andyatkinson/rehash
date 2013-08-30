class Comment < ActiveRecord::Base
  belongs_to :article
  validates_associated :article
  validates_presence_of :name, :body, :email, :article_id
  validates_presence_of :challenge, :on => :create

  validate :article_must_be_published, :correct_challenge_answer
  validates_format_of :email, :with => /^[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}$/i 
  after_save :email_site_owner
  is_gravtastic :email, :size => 50
  scope :recent, :limit => 5
  scope :ordered, :order => 'created_at DESC'
  
  attr_accessor :challenge
  
  private
    def article_must_be_published
      errors[:article_id] << "must be published" unless article.published?
    end
    
    def correct_challenge_answer
      return true if !self.new_record?
      errors[:challenge] << "is incorrect" if challenge.to_i != 4
    end
    
    def email_site_owner
      SiteMailer.comment_email(self).deliver
    end
end

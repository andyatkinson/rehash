class Site < ActiveRecord::Base
  attr_accessible :name, :tagline, :owner_name, :owner_email, :password, :password_confirmation, 
  :open_id_delegate, :open_id_server, :flickr_username, :twitter_username, :google_analytics_code
  validates_presence_of :name, :owner_name, :owner_email
  validates_confirmation_of :password, :if => :perform_password_validation?
  validates_presence_of :password, :if => :perform_password_validation?
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  validates_format_of :owner_email, :with => EMAIL_REGEX, :if => :owner_email?
  before_create :hash_password
  is_gravtastic :owner_email, :size => 30
  
  attr_accessor :password

  def default_tags
    Tag.all.first(10).join(', ')
  end
  
  def self.authenticate(pwd)
    website = Site.first  # TODO replace me with SiteHelper::website method
    website.hashed_password == Site.encrypted_password(pwd) ? true : false
  end
  
  private
    def hash_password
      self.hashed_password = Site.encrypted_password(self.password)
    end
    def self.encrypted_password(password)
      string_to_hash = password + 'rehash'
      Digest::SHA1.hexdigest(string_to_hash)
    end
    def perform_password_validation?
      self.new_record? ? true : !self.password.blank?
    end
end

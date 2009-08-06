class Site < ActiveRecord::Base
  attr_accessible :name, :tagline, :owner_name, :owner_email, :password
  validates_presence_of :name, :tagline, :owner_name
  validates_presence_of :password, :on => :create
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  validates_format_of :owner_email, :with => EMAIL_REGEX, :if => :owner_email?
  before_create :hash_password

  def default_tags
    Tag.all.first(10).join(',')
  end
  
  def self.authenticate(pwd)
    website = Site.first
    website.password == encrypted_password(pwd) ? true : false
  end
  
  private
    def hash_password
      self.password = Site.encrypted_password(self.password)
    end
    def self.encrypted_password(password)
      string_to_hash = password + 'rehash'
      Digest::SHA1.hexdigest(string_to_hash)
    end

end

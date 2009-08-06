class Comment < ActiveRecord::Base
  belongs_to :article
  validates_presence_of :name, :body, :email
  validates_format_of :email, :with => Site::EMAIL_REGEX
end

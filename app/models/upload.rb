class Upload < ActiveRecord::Base
  belongs_to :attachable, :polymorphic => true
  # if the config var S3_BUCKET (Heroku) is present, use S3 else use filesystem
  has_attached_file :data, 
                    :storage => ENV['S3_BUCKET'] ? :s3 : :filesystem,
                    :bucket => ENV['S3_BUCKET'],
                    :s3_credentials => {
                        :access_key_id => ENV['S3_KEY'],
                        :secret_access_key => ENV['S3_SECRET']
                    },
                    :path => ":attachment/:id/:style/:filename.:extension",
                    :styles => { :large => "800x800>",
                                 :small => '200x200#',
                                 :square => "100x100#" }
                                     
  validates_attachment_size :data, :less_than => 5.megabytes
end
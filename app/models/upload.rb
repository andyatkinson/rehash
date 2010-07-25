class Upload < ActiveRecord::Base
  belongs_to :attachable, :polymorphic => true
  has_attached_file :data, 
                    :storage => :s3,
                    :s3_credentials => "#{Rails.root}/config/s3.yml",
                    :path => ":attachment/:id/:style/:basename.:extension",
                    :styles => { :large => "800x800>",
                                 :small => '200x200#',
                                 :square => "100x100#" }
                                     
  validates_attachment_size :data, :less_than => 5.megabytes
end
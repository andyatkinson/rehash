class Upload < ActiveRecord::Base
  belongs_to :attachable, :polymorphic => true
  has_attached_file :data, 
                    :styles => { :large => "800x800>",
                                 :medium => "300x300>",
                                 :small => '200x200#',
                                 :square => "75x75#" }
  validates_attachment_size :data, :less_than => 5.megabytes
end
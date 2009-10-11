class Upload < ActiveRecord::Base
  belongs_to :attachable, :polymorphic => true
  has_attached_file :data, 
                      :styles => { :large => "800x800>",
                                   :medium => "300x300>",
                                   :square => "75x75#",
                                   :thumb => "100x100>" }
  validates_attachment_size :data, :less_than => 5.megabytes
end
class Upload < ActiveRecord::Base
  belongs_to :attachable, :polymorphic => true
  has_attached_file :data, 
                      :styles => { :medium => "300x300>",
                                   :thumb => "100x100>" }
  validates_attachment_size :data, :less_than => 5.megabytes
end
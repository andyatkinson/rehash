class Project < ActiveRecord::Base
  validates_presence_of :name, :description, :role, :duration, :url
  validates_format_of :url, :with => /^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?$/ix
  has_many :uploads, :as => :attachable
  accepts_nested_attributes_for :uploads
  has_friendly_id :name, :use_slug => true
end

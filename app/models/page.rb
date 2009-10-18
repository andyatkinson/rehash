class Page < ActiveRecord::Base
  validates_presence_of :name, :body
  named_scope :released, :conditions => {:published => true}
  has_friendly_id :name, :use_slug => true
end
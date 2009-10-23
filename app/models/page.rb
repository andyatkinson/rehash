class Page < ActiveRecord::Base
  validates_presence_of :name, :body
  validate :name_is_not_reserved
  named_scope :released, :conditions => {:published => true}
  has_friendly_id :name, :use_slug => true
  
  private
    def name_is_not_reserved
      if self.name && ['CONTACT'].include?(self.name.upcase)
        errors.add_to_base("Page name may not be a reserved word")
      end
    end
end
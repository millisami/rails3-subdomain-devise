class Subdomain
  include Mongoid::Document
  include Mongoid::FindBy
  
  field :name
  
  references_many :users, :dependent => :destroy
  
  # has_friendly_id :name, :use_slug => true, :strip_non_ascii => true
  validates_uniqueness_of :name, :case_sensitive => false
  validates_presence_of :name
end

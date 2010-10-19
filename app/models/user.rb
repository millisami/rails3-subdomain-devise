class User
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :name
  field :email
  
  referenced_in :subdomain
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates_presence_of :name, :subdomain_name
  validates_uniqueness_of  :email, :case_sensitive => false
  attr_accessor :subdomain_name
  attr_accessible :name, :subdomain_name, :email, :password, :password_confirmation, :remember_me
  # has_friendly_id :subdomain_name, :use_slug => true, :strip_non_ascii => true
  before_create :create_subdomain
  
  private
  def create_subdomain
    subdomain_exist = Subdomain.find_by_name(self.subdomain_name)
    if subdomain_exist
      self.subdomain = subdomain_exist
    else
      self.subdomain = Subdomain.find_or_create_by(:name => self.subdomain_name, :user_id => self.id)
    end
  end
end

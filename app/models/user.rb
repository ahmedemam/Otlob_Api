
class User 
  # We define this class as a Mongoid Document
  include Mongoid::Document
  # Generates created_at and updated_at
  include Mongoid::Timestamps
  # Defining our fields with their types
  field :name, type: String
  field :email, type: String
  field :password, type: String
  field :image, type: String
  # tags and comments will be stored inside the
  # Post document
  embeds_many :friends
  embeds_many :groups
  embeds_many :orders
  # Sort the posts
  scope :ordered, -> {order('created_at DESC')}
  # Validates that the slug is present and unique
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true
  validates :name, presence: true
  # The slug has to be unique since it can be used to query post.
  # Also defining an index will make the query more efficient
	

end
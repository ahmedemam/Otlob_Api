class Orderz
  # We define this class as a Mongoid Document
  include Mongoid::Document
  # Generates created_at and updated_at
  include Mongoid::Timestamps
  field :name, type: String
  field :restaurantName, type: String
  field :menuImage, type: String
  field :status, type: String
  field :date, type: DateTime, default: Time.now
  field :totalPrice, type: Integer, default: 0
  #
  scope :ordered, -> { order('created_at DESC') }
  field :items, type: Array
  field :user_id, type: String
  field :member, type:String
  embeds_many :friends
  embeds_many :groups
  # embeds_many:users
  embedded_in:user

 
  # validation
  
  validates :restaurantName, presence: true
  validates :menuImage, presence: true
  validates :status, presence: true
  validates :date, presence: true
  validates :name, presence: true, uniqueness: true
end
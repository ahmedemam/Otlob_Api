class Order
  # We define this class as a Mongoid Document
  include Mongoid::Document
  # Generates created_at and updated_at
  include Mongoid::Timestamps
  field :name, type: String
  field :restaurantName, type: String
  field :menuImage, type: String
  field :status, type: String
  field :friend_id, type: String
  field :date, type: DateTime, default: Time.now
  field :totalPrice, type: Integer, default: 0
  #
  embeds_many :items
  field :members, type: Array
  field :membergroup, type: Array
  embeds_many :friends
  embeds_many :groups 
  embedded_in :user
  # validation
  validates :name, presence: true
  validates :restaurantName, presence: true
  validates :menuImage, presence: true
  validates :status, presence: true
  validates :date, presence: true
end
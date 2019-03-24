class Order
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
  field :items, type: Array
  embeds_many :friends, class_name: "Friend"
  embeds_many :groups, class_name: "Groups"
  embedded_in :users, class_name: "Users"
  # validation
  validates :name, presence: true
  validates :restaurantName, presence: true
  validates :menuImage, presence: true
  validates :status, presence: true
  validates :date, presence: true
end
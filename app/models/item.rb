class Item
  # We define this class as a Mongoid Document
  include Mongoid::Document
  # Generates created_at and updated_at
  include Mongoid::Timestamps
  field :comment, type: String
  field :name, type: String
  field :amount, type: Integer
  field :price, type: Integer
  field :friend_id, type: String
  #
  embedded_in :order
  embeds_one :friend
  scope :ordered, -> { order('created_at DESC') }
end
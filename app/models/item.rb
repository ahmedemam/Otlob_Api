class Item
  # We define this class as a Mongoid Document
  include Mongoid::Document
  # Generates created_at and updated_at
  include Mongoid::Timestamps
  field :comment, type: String
  field :amount, type: Integer
  field :price, type: Integer
  #
  embedded_in :orders
  embeds_one :user
end
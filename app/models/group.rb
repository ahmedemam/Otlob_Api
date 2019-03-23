class Group
    # We define this class as a Mongoid Document
    include Mongoid::Document
    include Mongoid::Timestamps
    field :name, type: String
    embeds_many :users, class_name: "User", store_as: "members"
    embeds_one :users , class_name: "User", store_as: "owner"
    # Sort the posts
    scope :ordered, -> { order('created_at DESC') }
    # Validates that the slug is present and unique
    validates :name, presence: true
  end
class Group
    # We define this class as a Mongoid Document
    include Mongoid::Document
    include Mongoid::Timestamps
    field :name, type: String
    #  field :members, type: Array
    embeds_many :users
    # embedded_in :user
      # embeds_many :friends
      embedded_in:friend
    #  has_and_belongs_to_many:friends
    # Sort the posts
    scope :ordered, -> { order('created_at DESC') }
    # Validates that the slug is present and unique
    validates :name, presence: true
  end
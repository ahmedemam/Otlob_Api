class Group
    # We define this class as a Mongoid Document
    include Mongoid::Document
    include Mongoid::Timestamps
    field :name, type: String
    #  field :members, type: Array
   
     embedded_in :user
    # Sort the posts
    scope :ordered, -> { order('created_at DESC') }
    # Validates that the slug is present and unique
    validates :name, presence: true
  end
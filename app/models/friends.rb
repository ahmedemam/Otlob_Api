# app/models/post.rb
class Friend
  #users : mostafa
	#id,name,email,password,image,friends_id,group_id

    # We define this class as a Mongoid Document
    include Mongoid::Document
  
    # Generates created_at and updated_at
    include Mongoid::Timestamps
  
    # Defining our fields with their types
    
    # tags and comments will be stored inside the
    # Post document
    embedded_in :user_id,class_name:"User"
    embeds_many :friends_id,class_name:"User"

  
    # Sort the posts
    scope :ordered, -> { order('created_at DESC') }
  
    # Validates that the slug is present and unique
  
    # The slug has to be unique since it can be used to query post.
    # Also defining an index will make the query more efficient
    
  end
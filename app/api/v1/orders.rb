# app/api/v1/users.rb
module API
  module V1
    class Orders < Grape::API
      version 'v1', using: :path, vendor: 'otlob'
     namespace 'users/:user_id' do
        resources :orders  do
          # [done]
          # get: /orders      - return all orders
         desc 'List orders.'
  
             get do
              user = User.find(params[:user_id])
              user.orders.all
          end

          desc 'Get one order'
  
             get ':id' do
              user = User.find(params[:user_id])
              user.orders.find(params[:id])
          end


           desc 'Create Order.'
            params do
            
              requires :name, type: String
               requires :restaurantName, type: String
               requires :menuImage, type: String
               requires :status, type: String
               requires :totalPrice,type:Integer

            end
            post do
              user = User.find(params[:user_id])
              user.orders.find_or_create_by!({
               name:params[:name],
               restaurantName:params[:restaurantName],
               menuImage:params[:menuImage],
               status:params[:status],
               totalPrice:params[:totalPrice]
                
              })
            end

             desc 'Update Order.'

           params do
                requires :id, type: String
               requires :name, type: String
               requires :restaurantName, type: String
               requires :menuImage, type: String
               requires :status, type: String
          end
          put ':id' do
            user = User.find(params[:user_id])
            user.orders.find(params[:id]).update!({
               name:params[:name],
               restaurantName:params[:restaurantName],
               menuImage:params[:menuImage],
               status:params[:status]
            
            
            })
          end
###############
desc 'Update Order status.'

params do
     
    requires :status, type: String
end
put 'status/:id' do
 user = User.find(params[:user_id])
 myorder=user.orders.find(params[:id]);
 name=myorder["name"];
 restaurantName=myorder["restaurantName"];
 menuImage=myorder["menuImage"];

 user.orders.find(params[:id]).update!({
    name:name,
    restaurantName:restaurantName,
    menuImage:menuImage,
    status:params[:status]
 
 
 })
end
###############
           desc 'Delete Order.'

           params do
            requires :id, type: String
          end
          get ':id' do
            user = User.find(params[:user_id])
            user.orders.find(params[:id]).destroy
          end


          desc 'Create a friend on order.'
          namespace 'friends/:friend_id' do
          post ':id' do
 
            user = User.find(params[:user_id])
            myorder=user.orders.find(params[:id])
            
            # myorder.friends.find_or_create_by!(params[:friend_id])
   
           #myorder.update(members:[params[:friend_id]])
          #  myorder.push(members:[params[:friend_id]]);
          myorder.add_to_set(members:[params[:friend_id]]);
          
end

delete ':id' do
 
  user = User.find(params[:user_id])
  myorder=user.orders.find(params[:id])
  myorder.pull(members:params[:friend_id])
  
end




desc 'Get one order'
  
get ':id' do
 user = User.find(params[:user_id])
 myorder=user.orders.find(params[:id])
 myorder["members"]

end
end

desc 'Create a group.'
namespace 'groups/:group_id' do
post ':id' do

  user = User.find(params[:user_id])
  myorder=user.orders.find(params[:id])
  
myorder.add_to_set(membergroup:[params[:group_id]]);
 

#  myorder.update(items:[params[:group_id]]);
end


delete ':id' do
 
  user = User.find(params[:user_id])
  myorder=user.orders.find(params[:id])
  myorder.pull(membergroup:params[:group_id])
  
end

desc 'return a group in order.'

get ':id' do

  user = User.find(params[:user_id])
  myorder=user.orders.find(params[:id])
    g=user.groups.find(params[:group_id])
  

end

end
 desc 'return all order groups.'
 namespace 'groups' do
get ':id' do

  user = User.find(params[:user_id])
  myorder=user.orders.find(params[:id])
  groupsOrder=[];
  myorder["membergroup"].each do |groupid|
  g=user.groups.find(groupid)
  groupsOrder.push(g)
end
groupsOrder

end
end
# desc 'return a group.'

# get ':id' do

#   user = User.find(params[:user_id])
#   myorder=user.orders.find(params[:id])
#   myorder["members"]


# end

# desc 'delete a group.'

# delete ':id' do

#   user = User.find(params[:user_id])
#   myorder=user.orders.find(params[:id]);
#  myorder.find(params[:group_id]).destroy

# end












        end
      end
    end
  end
end


# # Order Class / Collection
# # @name
# # @date
# # @restaurantName
# # @menuImage
# # @status
# # @totalPrice
# # @items
# # @friends
# # @groups
# #----------------------------------------------
# ### get:    /orders                 - All Orders
# ### get     /orders/:id             - One Order
# # post:   /users/:id/orders/      - User's Orders
# # delete: /users/:id/orders/:id   - Delete Order
# # put:    /users/:id/orders/:id   - Update Order
# # get:    /users/:id/orders/:id   - One User One Order
# #----------------------------------------------
# # post:   /orders/:id/groups                - Add Group to Order
# # get:    /orders/:id/groups                - List Order's Groups
# # delete  /users/:id/orders/:id/groups/:id  - Delete One Group One Order - Owner
# #-# put     /users/:id/orders/:id/groups/:id  - Update One Group One Order - Owner
# #----------------------------------------------
# # post:   /orders/:id/friends                - Add Group to Order
# # get:    /orders/:id/friends                - List Order's Friends
# # delete  /users/:id/orders/:id/friends/:id  - Delete One Friends One Order - Owner
# #-# put   /users/:id/orders/:id/friends/:id  - Update One Friends One Order - Owner
# #----------------------------------------------
# # put:   /users/:id/order/:id/status
# #----------------------------------------------
# # get:    /order/:id/items                - get all items
# # post:   /users/:id/orders/:id/items     - add item
# # delete  /users/:id/orders/:id/items     - delete item
# # put     /users/:id/orders/:id/items     - update item





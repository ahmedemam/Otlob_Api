# app/api/v1/users.rb
module API
  module V1
    class Ordersz < Grape::API
      version 'v1', using: :path, vendor: 'otlob'
      namespace 'users/:user_id' do
        resources :orders do
          # [done]
          # get: /orders      - return all orders
          # desc 'return - All Orders'
          get do
            Order.find()
          end

          # [done]
          # get; /orders/:id - specific order
          # desc 'return - One Orders'
          # params do
          #   requires :id
          # end
          # get ':id' do
          #   Order.find_by(params[:id])
          # end

          # # function
          # # get:   /orders/owner/:id      - User's Orders
          # desc 'Users Orders'
          # params do
          #   requires :id
          # end
          # get '/owner/:id' do
          #   Order.find_by(owner: params[:id])
          # end

          # function
          # post: /orders - add new order
          desc 'Add New Order'
          params do
            
            requires :name, type: String
           
            requires :restaurantName, type: String
            requires :menuImage, type: String
            requires :status, type: String
            requires :totalPrice, type: Integer
            # requires :items, type: Array
            # requires :friends, type: Array
            # requires :groups, type: Array
          end
          ##############

       
          ##########
          post do

            user = User.find(params[:user_id])
             begin
              # fr= user.orders.find_by(name:params[:name])
              fr2=  user.orders.create_with( name: params[:name],
              restaurantName: params[:restaurantName],
             user_id:user['_id'],
              menuImage: params[:menuImage],
              status: params[:status],
              totalPrice: params[:totalPrice]).find_or_create_by(name: params[:name])
              
            
            rescue Exception => e
               
                { status: 'friend email dont exist' }
             
            end
            
          end
          # # function
          # # delete: /orders/:id - delete order
          # desc 'Delete One Order'
          # params do
          #   requires :id
          # end
          # delete ':id' do
          #   Order.find_by(params[:id]).destroy
          # end

          # # function
          # # update: /orders/:id
          # desc 'Update One Order'
          # params do
          #   requires :id
          #   requires :owner
          #   requires :name, type: String
          #   requires :date, type: DateTime
          #   requires :restaurantName, type: String
          #   requires :menuImage, type: String
          #   requires :status, type: String
          #   requires :totalPrice, type: Integer
          #   # requires :items, type: Array
          #   # requires :friends, type: Array
          #   # requires :groups, type: Array
          # end
          # put ':id' do
          #   if Order.find_by(params[:id])
          #     Order.update(
          #         owner: params[:owner],
          #         name: params[:name],
          #         restaurantName: params[:restaurantName],
          #         date: params[:date],
          #         menuImage: params[:menuImage],
          #         status: params[:status],
          #         totalPrice: params[:totalPrice]
          #     # items: params[:items],
          #     # friends: params[:friends],
          #     # groups: params[:groups]
          #     )
          #   else
          #     {status: 'order not found'}
          #   end
          # end
###############################
           desc 'Create a friend.'
           namespace 'friends/:friend_id' do
           post ':id' do
  
          user = User.find(params[:user_id])
          fr = user.friends.find(params[:friend_id])
          #  j= Order.find_by({_id:params[:id]})
        Order.find_by(_id:params[:id])
        #  Order.create_with(member:fr['email']).find_or_create_by(_id:params[:id])
        #  Order.update_attributes({"member"})
          # begin
            
          #  orderF= orderr.friends.create_with(email:fr['email']).find_or_create_by(email:fr['email'])
 
 
#   User.create_with(last_name: 'Johansson').find_or_create_by(first_name: 'Scarlett')
  
#   fr= User.find_by(email:params[:email])
# orderr=  fr.orders.create_with(name:params[:name]).find_or_create_by(name:order['name'])
    
  
# rescue Exception => e
   
#     { status: 'friend email dont exist' }
# end
end
end

           ######################
          end
        end
    end
    end
    end
  


# Order Class / Collection
# @name
# @date
# @restaurantName
# @menuImage
# @status
# @totalPrice
# @items
# @friends
# @groups
#----------------------------------------------
### get:    /orders                 - All Orders
### get     /orders/:id             - One Order
# post:   /users/:id/orders/      - User's Orders
# delete: /users/:id/orders/:id   - Delete Order
# put:    /users/:id/orders/:id   - Update Order
# get:    /users/:id/orders/:id   - One User One Order
#----------------------------------------------
# post:   /orders/:id/groups                - Add Group to Order
# get:    /orders/:id/groups                - List Order's Groups
# delete  /users/:id/orders/:id/groups/:id  - Delete One Group One Order - Owner
#-# put     /users/:id/orders/:id/groups/:id  - Update One Group One Order - Owner
#----------------------------------------------
# post:   /orders/:id/friends                - Add Friend to Order
# get:    /orders/:id/friends                - List Order's Friends
# delete  /users/:id/orders/:id/friends/:id  - Delete One Friends One Order - Owner
#-# put   /users/:id/orders/:id/friends/:id  - Update One Friends One Order - Owner
#----------------------------------------------
# put:   /users/:id/order/:id/status
#----------------------------------------------
# get:    /order/:id/items                - get all items
# post:   /users/:id/orders/:id/items     - add item
# delete  /users/:id/orders/:id/items     - delete item
# put     /users/:id/orders/:id/items     - update item

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

            end
            post do
              user = User.find(params[:user_id])
              user.orders.find_or_create_by!({
               name:params[:name],
               restaurantName:params[:restaurantName],
               menuImage:params[:menuImage],
               status:params[:status]
                
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
          post ':id' do
            user = User.find(params[:user_id])
            user.orders.find(params[:id]).update!({
               name:params[:name],
               restaurantName:params[:restaurantName],
               menuImage:params[:menuImage],
               status:params[:status]
            
            
            })
          end

           desc 'Delete Order.'

           params do
            requires :id, type: String
          end
          get ':id' do
            user = User.find(params[:user_id])
            user.orders.find(params[:id]).destroy
          end

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

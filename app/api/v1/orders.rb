# app/api/v1/users.rb
module API
  module V1
    class Orders < Grape::API
      version 'v1', using: :path, vendor: 'samurails-blog'
      resources :orders do
        # get: /orders - return all orders
        desc 'Get All Orders'
        get do
          Orders.all.ordered
        end

        # post: /orders - add new order
        desc 'Add New Order'
        params do
          requires :name, type: String
          requires :date, type: DateTime
          requires :restaurantName, type: String
          requires :menuImage, type: String
          requires :status, type: String
          requires :totalPrice, type: Integer
          requires :items, type: Array

        end
      end
    end
  end
end

# Order Class / Collection
# @name
# @date,
# @restaurantName
# @menuImage
# @status
# @totalPrince
# @items
# @friends
# @groups


# get:    /orders
# post:   /orders
# delete: /orders/:id
# put:    /orders/:id
#
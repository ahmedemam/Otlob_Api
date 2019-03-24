# app/api/v1/users.rb
module API
  module V1
    class Orders < Grape::API
      version 'v1', using: :path, vendor: 'otlob'
      resources(:orders) do
        # function
        # get: /orders - return all orders
        desc 'GetAllOrders'
        get do
          Order.each
        end

        # function
        # get; /orders/:id - specific order
        desc 'GetOneOrder'
        params do
          requires :id
        end
        get ':id' do
          Order.find_by(params[:id])
        end

        # function
        # get; /orders/owner/:id - return user's order
        desc 'get all orders for specific user'
        params do
          requires :id
        end
        get 'owner/:id' do
          Order.find_by(owner: params[:id])
        end

        # function
        # post: /orders - add new order
        desc 'Add New Order'
        params do
          requires :owner
          requires :name, type: String
          requires :date, type: DateTime
          requires :restaurantName, type: String
          requires :menuImage, type: String
          requires :status, type: String
          requires :totalPrice, type: Integer
          requires :items, type: Array
          requires :friends, type: Array
          requires :groups, type: Array
        end
        post do
          O
          Order.create(
            owner: params[:owner],
            name: params[:name],
            restaurantName: params[:restaurantName],
            date: params[:date],
            menuImage: params[:menuImage],
            status: params[:status],
            totalPrice: params[:totalPrice],
            items: params[:items],
            friends: params[:friends],
            groups: params[:groups]
          )
        end
        # function
        # delete: /orders/:id - delete order
        desc 'Delete One Order'
        params do
          requires :id
        end
        delete ':id' do
          Order.find_by(params[:id]).destroy
        end

        # function
        # update: /orders/:id
        desc 'Update One Order'
        params do
          requires :id
          requires :owner
          requires :name, type: String
          requires :date, type: DateTime
          requires :restaurantName, type: String
          requires :menuImage, type: String
          requires :status, type: String
          requires :totalPrice, type: Integer
          requires :items, type: Array
          requires :friends, type: Array
          requires :groups, type: Array
        end
        put ':id' do
          if Order.find_by(params[:id])
            Order.update(
              owner: params[:owner],
              name: params[:name],
              restaurantName: params[:restaurantName],
              date: params[:date],
              menuImage: params[:menuImage],
              status: params[:status],
              totalPrice: params[:totalPrice],
              items: params[:items],
              friends: params[:friends],
              groups: params[:groups]
            )
          else
            { status: 'order not found' }
          end
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
# @totalPrince
# @items
# @friends
# @groups

# get:    /orders
# get     /orders/:id
# post:   /orders
# delete: /orders/:id
# put:    /orders/:id
# get:    /orders/owner/:id

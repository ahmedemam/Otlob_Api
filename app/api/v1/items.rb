# frozen_string_literal: true

# app/api/v1/items.rb
module API
  module V1
    class Items < Grape::API
      namespace 'orders/:order_id' do
        resources :items do
          desc 'Create New-Item'
          params do
            requires :comment, type: String
            requires :amount, type: Integer
            requires :price, type: Integer
          end
          post do
            order = Order.find_by(params[:order_id])
            order.items.create!(
              comment: params[:comment],
              amount: params[:amount],
              price: params[:price]
            )
          end

          desc 'Update Item'
          params do
            requires :id, type: String
            requires :comment, type: String
            requires :price, type: Integer
            requires :amount, type: Integer
          end
          put ':id' do
            order = Order.find_by(params[:post_id])
            order.items.find(params[:id]).update!(
              comment: params[:comment],
              amount: params[:amount],
              price: params[:price]
            )
          end

          desc 'Delete Item'
          params do
            requires :id, type: String
          end
          delete ':id' do
            order = Order.find_by(params[:order_id])
            order.items.find_by(params[:id]).destroy
          end
        end
      end
    end
  end
end

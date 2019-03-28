module GrapeBootstrap
    class Items < Grape::API
      version 'v1', using: :path, vendor: 'otlob'
      namespace 'users/:user_id' do
      namespace 'orders/:order_id' do
       namespace 'friends/:friend_id' do
        resources :items do
          
          get do
            user = User.find(params[:user_id])
            myorder=user.orders.find(params[:order_id])
            myorder.items.all
          end  
          desc 'Create New-Item'
          params do
            requires :comment, type: String
            requires :amount, type: Integer
            requires :price, type: Integer
            requires :name, type: String
          end
          post do
            user = User.find(params[:user_id])
  myorder=user.orders.find(params[:order_id])
             myorder.items.find_or_create_by!(
              comment: params[:comment],
              amount: params[:amount],
              price: params[:price],
              name:params[:name],
              friend_id:params[:friend_id]
            )
          end

          desc 'Update Item'
          params do
            requires :id, type: String
            requires :comment, type: String
            requires :price, type: Integer
            requires :amount, type: Integer
            requires  :name, type: String
          end
          put ':id' do
            user = User.find(params[:user_id])
  myorder=user.orders.find(params[:order_id])
  myitem=myorder.items.find(params[:id])
            myitem.update!(
              comment: params[:comment],
              amount: params[:amount],
              price: params[:price],
              name:params[:name],
              friend_id:params[:friend_id]
            )
          end

          desc 'Delete Item'
         
          delete ':id' do
            user = User.find(params[:user_id])
  myorder=user.orders.find(params[:order_id])
  myitem=myorder.items.find(params[:id])
            myitem.destroy
          end
        end
      end
    end
  end
end
end
# app/api/v1/comments.rb
module API
    module V1
      class Groups < Grape::API
        version 'v1', using: :path, vendor: 'otlob'
  
        # Nested resource so we need to add the post namespace
        namespace 'users/:user_id' do
          resources :friends do
  
            desc 'Create a friend.'
            params do
              requires :user_id, type: String
              requires :friends_id, type: Array
          
            end
            post do
              user = User.find(params[:user_id])
              user.Friends.create!({
                user_id: params[:user_id],
               friends_id: params[:friends_id],
                
              })
            end
  
       
  
            desc 'Delete a Friend.'
            params do
              requires :id, type: String, desc: 'Status ID.'
            end
            delete ':id' do
              user = User.find(params[:user_id])
              user.friends.find(params[:id]).destroy
            end
  
          end
        end
  
      end
    end
  end
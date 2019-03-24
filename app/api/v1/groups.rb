# app/api/v1/comments.rb
module API
  module V1
    class Groups < Grape::API
      version 'v1', using: :path, vendor: 'otlob'

      # Nested resource so we need to add the post namespace
      namespace 'users/:user_id' do
        resources :groups do
          desc 'Create a group.'
          params do
            requires :user_id, type: String
            requires :users_id, type: Array
            requires :name, type: String
          end
          post do
            user = User.find(params[:user_id])
            user.Groups.create!(
              owner: params[:user_id],
              members: params[:users_id],
              name: params[:name]
            )
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

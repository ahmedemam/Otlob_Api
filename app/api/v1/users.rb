# app/api/v1/users.rb
module API
    module V1
      class Users < Grape::API
        version 'v1', using: :path, vendor: 'otlob'
        resources :users do
          desc 'Returns all users'
          get do
            User.all.ordered
          end


           desc 'Create a user.'
          params do
            requires :name, type: String
            requires :email, type: String
            requires :password, type: String
            requires :image, type: String
          end
          post do
           
            User.create!({
              author: params[:name],
              email: params[:email],
              website: params[:password],
              content: params[:image]
            })
          end
  
          desc "Return a specific User"
          params do
            requires :id, type: String
          end
          get ':id' do
            User.find(params[:id])
          end
        end
      end
    end
  end
# app/api/v1/posts.rb
module API
    module V1
      class Users < Grape::API
        version 'v1', using: :path, vendor: 'samurails-blog'
  
        resources :users do
  
          desc 'Returns all users'
          get do
            User.all.ordered
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
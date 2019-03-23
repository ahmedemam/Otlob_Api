# app/api/v1/admin/posts.rb
module API
    module V1
      module Admin
        class users < Grape::API
          version 'v1', using: :path, vendor: 'samurails-blog'
  
          namespace :admin do
  
            resources :users do
  
              desc 'Returns all users'
              get do
                User.all.ordered
              end
  
              desc "Return a specific post"
              params do
                requires :id, type: String
              end
              get ':id' do
                User.find(params[:id])
              end
  
              desc "Create a new user"
              params do
                requires :name, type: String
                requires :email, type: String
                requires :password, type: String
                requires :image, type: String
              end
              user do
                User.create!(name: params[:name],
                email: params[:email],
                password: params[:password]),
                image: params[:image])
              end
  
              desc "Update a user"
              params do
                requires :id, type: String
                requires :name, type: String
                requires :email, type: String
                requires :password, type: String
                requires :image, type: String
              end
              put ':id' do
                user = User.find(params[:id])
                user.update(name: params[:name],
                            email: params[:email],
                            password: params[:password]),
                            password: params[:password]),
              end
  
              desc "Delete a post"
              params do
                requires :id, type: String
              end
              delete ':id' do
                Post.find(params[:id]).destroy
              end
  
            end
          end
        end
      end
    end
  end
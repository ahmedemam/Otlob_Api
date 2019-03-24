# app/api/v1/posts.rb
module API
    module V1
      class Users < Grape::API
        version 'v1', using: :path, vendor: 'otlob'
  
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
  
          # desc "Login"
          # params do
          #   requires :email, type: String
          #   requires :password, type: String
          # end
          # post do
          #   user = User.find(params[:email])
          #   if user
          #     {user}
          #   else
          #     get :status do
          #       { status: 'user not exist' }
          #     end
          #   end
          # end

          desc "Register"
          params do
            requires :email, type: String
            requires :name, type: String
            requires :password, type: String
          end

          post do
            begin
              user = User.find_by(email:params[:email])
            rescue ActiveRecord::RecordNotFound => e
              { status: 'error' }
            end
            
     
              User.create!({
                name: params[:name],
                email: params[:email],
                password: params[:password],
                
              })
           
              
          end
          # post do
          #   user = User.find(params[:email])
          #   user.create!({
          #     email: params[:email]
          #     name: params[:name]
          #     password: params[:password]
          #   })
          # end
          
        end
      end
    end
  end
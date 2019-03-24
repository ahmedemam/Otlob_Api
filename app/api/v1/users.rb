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
  
         
          desc "Register"
          params do
            requires :email, type: String
            requires :name, type: String
            requires :password, type: String
          end

           post do
            begin
              user = User.find_by(email:params[:email])
              { status: 'Already Exist' }
            rescue Exception => e
                User.create!({
                name: params[:name],
                email: params[:email],
                password: params[:password],
                
              })

             
            end
            
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
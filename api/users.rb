module GrapeBootstrap
      class Users < Grape::API
        version 'v1', using: :path, vendor: 'otlob'
  
        resources :users do
          ##########################
          desc 'Returns all users'
          get do
            User.all.ordered
          end
          ##########################          
          desc "Return a specific User"
          params do
            requires :id, type: String
          end
          get ':id' do
            User.find(params[:id])
          end

          ##########################          
          desc "Login"
          params do
            requires :email, type: String
            requires :password, type: String
          end
          post "/login" do
            begin
              user = User.find_by(email:params[:email], 
                password: params[:password])
              { status: 'User Exists, login success' }
            rescue Exception => e
              { status: 'email or password is not valid' }
            end
          end
          ##########################

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
        end
      end
    end

# get:    /users        => list all users
# get:    /users/:id    => list one user
# post:   /users        => register (create user)
# post:   /users/login  => normal login
# app/api/v1/posts.rb
require 'grape'
require 'omniauth'
require 'omniauth-facebook'

module API
    module V1

class Auth < Grape::API
  include OmniAuth::Strategy

  format :json
  {status:"sss"}
  use Rack::Session::Cookie
  use OmniAuth::Strategies::Facebook, '595117117671783', '9b2cd65983a4b556131992c4bf068ee7'
  redirect '/auth'
end

# run your base api here. Root, Base, whatever you called it.


      class Users < Grape::API
        version 'v1', using: :path, vendor: 'otlob'
  
        resources :users do
          ##########################
          desc 'Returns all users'
          get do
            User.all.ordered
          end



 desc 'Get User Data From Facebook'
          get '/auth/facebook/callback' do
             # {status:request.env['omniauth.auth']}

            

      {status:Request.env['omniauth.auth']}
      # {status:request.env["action_dispatch.request.unsigned_session_cookie"]}
      # {status:request.env['omniauth.origin']}


    #         @user = User.find_or_create_from_auth_hash(request.env["omniauth.auth"])
    # session[:user_id] = @user.id
    # {'status:ok'}
    # redirect_to :me

           # redirect "../../../auth/facebook/callback"
          end

          #  desc 'Get User Data From Gmail'
          # get '/auth/google_oauth2' do
          #  redirect "../../../auth/google_oauth2/callback"
          # end

          
          # get '/auth/:provider/callback' do
          #  redirect "sessions#create"
          # end


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
          post "/ll" do
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
  end

# get:    /users        => list all users
# get:    /users/:id    => list one user
# post:   /users        => register (create user)
# post:   /users/login  => normal login
# app/api/v1/comments.rb
module API

    module V1
      class Groups < Grape::API
        version 'v1', using: :path, vendor: 'otlob'
  
        # Nested resource so we need to add the post namespace
        namespace 'users/:user_id' do

          resources :groups do

            desc 'List groups.'
  
             get do
              user = User.find(params[:user_id])
            user.groups.all.ordered
          end

            desc 'Create group.'
            params do
              requires :name, type: String

            end
            post do
              user = User.find(params[:user_id])
              user.groups.find_or_create_by!({
               name:params[:name]
                
              })
            end
  
        desc 'Update Group.'

           params do
            requires :id, type: String
            requires :name, type: String
          end
          post ':id' do
            user = User.find(params[:user_id])
            user.groups.find(params[:id]).update!({
              name: params[:name]})
          end
  
            desc 'Delete Group.'

           params do
            requires :id, type: String
          end
          get ':id' do
            user = User.find(params[:user_id])
            user.groups.find(params[:id]).destroy
          end
          namespace 'friends/:friend_id' do
            desc 'Add Member.'
            params do
              requires :friend_id, type: String
              requires :group_id, type: String

            end
            post ':group_id' do
              user = User.find(params[:user_id])
            group = user.groups.find(params[:group_id])
            group.friends.create!(friend_id:params[:friend_id]);

            end

         

           
          end
        end
      end
    end
  end
  end

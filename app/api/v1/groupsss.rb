# app/api/v1/comments.rb
module API

    module V1
      class Groupss < Grape::API
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
  # users/:id/orders
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
          
            desc 'Add Member.'
            # params do
            #   requires :friend_id, type: String
            #   requires :group_id, type: String

            # end
            namespace 'friends/:friend_id' do
            put ':group_id' do
            
              user = User.find(params[:user_id])
             group= user.groups.find(params[:group_id])
               group.friend.create!(name:params[:friend_id])
            # frr=group.friend.update_attributes!(params[:friend_id])
               
            # frr=group.friend.create_with(params[:friend_id])
            # user.groups.where(:oid=>group['_id']).update_all(:name =>"testrename");
            # user.groups[ObjectId(group['_id'])]
            # user.groups.Update(Query.EQ("_id",ObjectId.Parse(group['_id']),Update.Set(params[:friend_id])))
            # User.update(
            #   {"_id"=>params[:user_id]},
            # group.friend.
            # )
            # group['_id']
             end

          #################
      #     post do
      #       user = User.find(params[:user_id])
      #       begin
      #       fr= User.find_by(email:params[:email])
           
           
      #     #   User.create_with(last_name: 'Johansson').find_or_create_by(first_name: 'Scarlett')
            
      #     #   fr= User.find_by(email:params[:email])
      #     fr2=  user.friends.create_with(email:params[:email]).find_or_create_by(email:fr['email'])
              
            
      #     rescue Exception => e
             
      #         { status: 'friend email dont exist' }
           
      #     end
      # end

             #############

           
          end
        end
      end
    end
  end
  end

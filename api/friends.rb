module GrapeBootstrap
      class Friends < Grape::API
        version 'v1', using: :path, vendor: 'otlob'
  
        # Nested resource so we need to add the post namespace
        namespace 'users/:user_id' do
          resources :friends do
  
            desc 'Create a friend.'
            params do
              requires :email, type: String
             
            end
            post do
              user = User.find(params[:user_id])
              begin
              fr= User.find_by(email:params[:email])
             
             
            #   User.create_with(last_name: 'Johansson').find_or_create_by(first_name: 'Scarlett')
              
            #   fr= User.find_by(email:params[:email])
            fr2=  user.friends.create_with(email:params[:email]).find_or_create_by(email:fr['email'])
                
              
            rescue Exception => e
              
                { status: 'friend email dont exist' }
                #fr2=  user.friends.create_with(email:params[:email]).find_or_create_by(email:fr['email'])
             
            end
        end
            #   user.friends.create!({
            #     email: params[:email]
                
            #   })
              
            
           
  
            # desc 'Update a comment.'
            # params do
            #   requires :id, type: String
            #   requires :author, type: String
            #   requires :email, type: String
            #   requires :website, type: String
            #   requires :content, type: String
            # end
            # put ':id' do
            #   post = Post.find(params[:post_id])
            #   post.comments.find(params[:id]).update!({
            #     author: params[:author],
            #     email: params[:email],
            #     website: params[:website],
            #     content: params[:content]
            #   })
            # end
  
            desc 'Delete a friend.'
           
            delete ':id' do
              user = User.find(params[:user_id])
              user.friends.find(params[:id]).destroy
            end
  
          end
        end
  
      end
    end
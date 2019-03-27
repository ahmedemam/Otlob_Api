# application.rb
require 'grape'
require 'mongoid'

Mongoid.load! "config/mongoid.yml"
# Load files from the models and api folders
Dir["#{File.dirname(__FILE__)}/app/models/**/*.rb"].each {|f| require f}
Dir["#{File.dirname(__FILE__)}/app/api/**/*.rb"].each {|f| require f}
Dir["/home/hardworker/Documents/RubyProject/Otlob_Api/app/api/v1/*.rb"].each {|f| require f}
Dir["/home/hardworker/Documents/RubyProject/Otlob_Api/app/models/**/*.rb"].each {|f| require f}
# Grape API class. We will inherit from it in our future controllers.
module API
  class Root < Grape::API
    format :json
    prefix :api
    # Simple endpoint to get the current status of our API.
    get :status do
      {status: 'ok'}
    end
    mount V1::Users
    mount V1::Friends
    mount V1::Groups
    mount V1::Orders
    mount V1::Items
  end
end

# Mounting the Grape application
Otlob = Rack::Builder.new {
  map "/" do
    run API::Root
  end

}



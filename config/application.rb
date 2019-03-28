$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'api'))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'app'))
$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'boot'
require 'mongoid'

Bundler.require :default, ENV['RACK_ENV']
Mongoid.load!(File.expand_path('mongoid.yml', './config'))

Dir[File.expand_path('../../api/*.rb', __FILE__)].each do |f|
  require f
end

Dir[File.expand_path('../../app/models/*.rb', __FILE__)].each do |f|
  require f
end

require 'api'

module API
  class Root < Grape::API
    format :json
    prefix :api

    # Simple endpoint to get the current status of our API.
    get :status do
      { status: 'ok' }
    end
     mount V1::Users
     mount V1::Friends
     mount V1::Groups
     mount V1::Orders

require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module YalaNotlob
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

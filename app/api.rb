module GrapeBootstrap
  class API < Grape::API
    version 'v1'
  #  prefix 'api'
  format :json 

    rescue_from Grape::Exceptions::Validation do |e|
      Rack::Response.new({
        status:  e.status,
        message: e.message,
        param:   e.param
      }.to_json, e.status)
    end
    
    mount GrapeBootstrap::Users
    mount GrapeBootstrap::Friends
    mount GrapeBootstrap::Groups
    mount GrapeBootstrap::Orders
    mount GrapeBootstrap::Items
  end
end
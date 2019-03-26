class MeController < ApplicationController
#The line before_action tells Rails to run the :authenticate method before any action is called. 
before_action :authenticate
    def show
    end
end

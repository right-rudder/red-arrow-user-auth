# app/controllers/admin_controller.rb
class AdminController < ApplicationController
    before_action :authenticate_admin!
    before_filter :check_for_admin
  
    def check_for_admin
        if current_user.nil? || !current_user.is_admin?
            redirect_to root_path, alert "You must be an admin to access this path."
        end
    end
    #def index
      # Your admin controller logic goes here
    #end
end

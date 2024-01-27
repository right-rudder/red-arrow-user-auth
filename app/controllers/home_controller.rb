class HomeController < ApplicationController 
    def index
        if !user_signed_in?
             redirect_to new_user_session_path # Redirect to the sign-in page if the user is not signed in
        end 
        
        @unapproved_users = User.where(is_approved: false)
        
    end
end
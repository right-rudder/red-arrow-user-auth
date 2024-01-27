class HomeController < ApplicationController 
    def index
        if !user_signed_in?
             redirect_to new_user_session_path # Redirect to the sign-in page if the user is not signed in
        else 
            # Rails.logger.info("**** Request referer " + request.referer + " document path " + documents_path)
            ## this is for Red arrow only to redirect to Documents page 
            if !current_user&.is_admin? && !request.referer.to_s.include?(documents_path)   
                redirect_to documents_path
            end
        end 
        ## the unapproved users is for Admin function. 
        @unapproved_users = User.where(is_approved: false)
        
    end
end
# app/controllers/users_controller.rb
class UsersController < ApplicationController
    before_action :authenticate_user! # Ensure the user is authenticated
  
    def show
        @user = current_user
    end

    def edit
      @user = current_user
    end

    def update
        @user = current_user
        if @user.update(user_params)
            redirect_to root_path, notice: "Your information was successfully updated."
        else
          flash.now[:error] = 'There was an error updating your profile.'
          render 'edit'  # Stay on the edit page and display validation errors
        end
    end
  

   def set_user
    @user = current_user
   end

   private
    
    def user_params
      params.require(:user).permit(:email, :first_name, :middle_initial, :last_name, 
      :birthday, :address_1, :address_2, :city, :state, :zip_code, :phone, 
      :emergency_contact_name, :emergency_contact_number)
     end
end
  
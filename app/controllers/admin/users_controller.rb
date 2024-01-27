# app/controllers/admin/users_controller.rb
class Admin::UsersController < ApplicationController
  before_action :check_for_admin
  before_action :set_user, only: [:edit, :update]

  def check_for_admin
      if current_user.nil? || !current_user.is_admin?
          redirect_to root_path, alert: "You must be an admin to access this path."
      end
  end

  def index
    @users = User.all
    @unapproved_users = User.where(approved: false)
  end

  def edit
  end

  def update
    @user = User.find(params[:id])
    was_not_approved = !@user.is_approved
    msg = "User "
    if @user.update(user_params)
      if was_not_approved && @user.is_approved
        msg += ' approved and '
        # Send approval email to the user
        UserMailer.account_approval(@user).deliver_now
      end
      msg += ' updated successfully.'
      redirect_to admin_users_path, notice: msg 
    else
      render :edit
    end
  end

  def show_user_profile
    @user = User.find(params[:id])
    render 'users/show'
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :is_admin, :is_student, :is_instructor, 
                  :is_guest, :is_maintenance, :is_frontoffice, :is_dispatcher, :is_approved,
                  :first_name, :middle_initial, :last_name,
                  :birthday, :address_1, :address_2, :city, :state, :zip_code, :phone, 
                  :emergency_contact_name, :emergency_contact_number
                  )
  end
end

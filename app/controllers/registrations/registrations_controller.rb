# frozen_string_literal: true

class Registrations::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  def create
     super
     if resource.persisted? 
        # Retrieve the admin user's email address
        admin_email = User.where(is_admin: true).first.email

        Rails.logger.info("**** User signed up. Email to Admin: " + admin_email)

        # Customize the email subject and body as needed
        subject = "New User Signup Requires Approval"
        body = "A new user has signed up and requires your approval for the user email below:\n\n"
        body += "Email: #{resource.email}\n"
        # Add other relevant details as needed
        
        Rails.logger.info("Email Body: " + body)
        # Send the email using Application Mailer
        UserMailer.email_notification(admin_email, subject, body).deliver_now
    else
        Rails.logger.info("**** Signup failed. Email not sent.")
       
       # Rails.logger.info("**** ENVs " + ENV['SMTP_USERNAME'] + " " + 
       # ENV['DEFAULT_FROM'] + " " + ENV['SMTP_ADDRESS'])
    end

   end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  def after_sign_up_path_for(resource)  
    Rails.logger.info("**** After User Sign Up Path For") 
     #super(resource)
     #This can be a welcome page but for now it's Document Path. 
     documents_path 
  end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end

class UserMailer < ApplicationMailer
    # See default value in .env file
    default from: ENV['DEFAULT_FROM']

    # email notification is a generic email send:
    # email address and subject, body/message is custom depending on the message
    def email_notification(email_address, subject, body)
        @body = body
        mail(to: email_address, bcc: ENV['NO_REPLY'], 
            subject: subject) 
    end

    def account_approval(user)
        @user = user
        # BCC - is for testing only remove or add BCC if necessary.
        mail(to: @user.email, bcc: [ENV['NO_REPLY'], "tonxsantizi@gmail.com"], 
            subject: 'Fly Red Arrow approved your membership request')
    end
end

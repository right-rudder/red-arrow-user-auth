class ApplicationMailer < ActionMailer::Base
  default from: "from@example.com"
  layout "mailer"

  def email_notifification(email_address, subject, body)
    @body = body
    # Uncomment below when EMAIL is configured. 
    # See set up your email delivery settings in config/environments/development.rb and config/environments/production.rb.
    # mail(to: email_address, subject: subject) 
  end

end

class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.reset_password_email.subject
  #
  def reset_password_email(user)
    @token = user.reset_password_token
    mail to: user.email
  end

  def activation_needed_email(user)
    @token = user.activation_token
    mail to: user.email
  end
  
  def activation_success_email(user)
    mail to: user.email
  end
end

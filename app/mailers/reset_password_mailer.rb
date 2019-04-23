class ResetPasswordMailer < ApplicationMailer
  default from: "example@gmail.com"
  layout "mailer"

  def reset_password_email account
    @account = account
    @auth_token = account.auth_token
    mail to: @account.email, subject: I18n.t("message_mails.reset_password.subject")
  end
end

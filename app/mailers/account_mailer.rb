class AccountMailer < ApplicationMailer
  default from: "example@gmail.com"
  layout "mailer"

  def register_account_email account
    @account = account
    @auth_token = account.auth_token
    mail to: @account.email, subject: I18n.t("message_mails.register_account.subject")
  end
end

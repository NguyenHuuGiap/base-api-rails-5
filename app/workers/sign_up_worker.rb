class SignUpWorker < MailerWorker
  def perform account_id
    account = Account.find account_id
    account_info = {account_id: account_id, mail_to: account.email}
    send_mailer AccountMailer.register_account_email(account), receiver_info: account_info
  end
end

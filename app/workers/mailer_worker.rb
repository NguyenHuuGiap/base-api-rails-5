class MailerWorker < ApplicationWorker
  sidekiq_options queue: :mailer, retry: 1

  private
  def send_mailer mailer, args
    mailer.deliver
  rescue StandardError => e
    args[:error] = e
  ensure
    raise args[:error] if args[:error].present?
  end
end

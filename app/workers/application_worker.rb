class ApplicationWorker
  include Sidekiq::Worker

  def perform *_args
    raise NotImplementedError, "NotImplementedError"
  end
end

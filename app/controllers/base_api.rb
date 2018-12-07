module BaseAPI
  extend ActiveSupport::Concern

  included do
    include HandleError

    rescue_from StandardError do |e|
      case
      when e.is_a?(ActiveRecord::RecordInvalid)
        handle_error! e, e.record.errors.messages
      else
        handle_error! e
      end
    end
  end
end

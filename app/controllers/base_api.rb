module BaseAPI
  extend ActiveSupport::Concern

  included do
    include HandleError

    rescue_from ActiveRecord::UnknownAttributeError, ActiveRecord::StatementInvalid,
      JSON::ParserError do |e|
      handle_error! e
    end

    rescue_from ActiveRecord::RecordInvalid do |e|
      handle_error! e, e.record.errors.messages
    end

    rescue_from "Errors::NotFound", ActiveRecord::RecordNotFound do |e|
      handle_error! e
    end
  end
end

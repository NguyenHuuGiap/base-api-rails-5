module BaseAPI
  extend ActiveSupport::Concern

  included do
    include Helpers::HandleErrorHelper
    include Helpers::UserAuthenticationHelper

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

    rescue_from "Errors::InternalServerError", with: :internal_server_error
    rescue_from "Errors::BadRequest", with: :bad_request
    rescue_from "Errors::ResetPasswordTokenExpired", "Errors::Unauthorized", with: :unauthorized

    protected
    def internal_server_error(exception)
      json_response(:internal_server_error, exception_format(exception, "MUER00018"))
    end
  
    def bad_request(exception)
      json_response(:bad_request, exception_format(exception, "MUER00019"))
    end
  
    def unauthorized(exception)
      json_response(:bad_request, exception_format(exception, "MUER00031"))
    end
  end
end

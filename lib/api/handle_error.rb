module HandleError
  include Response

  def handle_error! error, details = nil
    key = error.is_a?(Symbol) ? error : error.class.name.demodulize.underscore.to_sym
    message = {
      error_code: error_code_from(key),
      error_message: I18n.t("api_error.#{key}"),
      details: details
    }
    json_response key, message
  end

  def error_code_from key
    ApiErrorCode::ERROR_CODES[key] || ApiErrorCode::ERROR_CODES[:fallback]
  end
end

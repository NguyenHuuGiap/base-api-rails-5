class ApplicationController < ActionController::API
  include ActionController::Serialization

  include BaseAPI

  serialization_scope nil

  def authenticate_account!
    handle_error! :unauthenticated unless current_account
  end

  def current_account
    @current_account ||= auth_token&.account
  end

  def auth_token
    @auth_token = AuthToken.from_token access_token_header
  end

  private
  def access_token_header
    auth_header = request.headers[Settings.access_token_header]
    return nil unless auth_header

    auth_header.scan(/^#{Settings.access_token_value_prefix} (.+)$/i).dig 0, 0
  end
end

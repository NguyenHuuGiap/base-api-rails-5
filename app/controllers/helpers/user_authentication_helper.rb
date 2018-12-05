module Helpers::UserAuthenticationHelper
  def authenticate_user!
    handle_error! :unauthenticated unless current_user
  end

  def current_user
    @current_user ||= auth_token&.user
  end

  def auth_token
    @auth_token = AuthToken.from_token access_token_header
  end

  def current_company
    company_user = current_user.company_user
    raise APIError::Unauthenticated unless company_user&.approved?

    company_user.company
  end

  def access_token_header
    auth_header = request.headers[Settings.access_token_header]
    return nil unless auth_header
    auth_header.scan(/^#{Settings.access_token_value_prefix} (.+)$/i).dig 0, 0
  end
end

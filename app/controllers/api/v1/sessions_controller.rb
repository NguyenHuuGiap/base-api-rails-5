module Api::V1
  class SessionsController < ApiController
    before_action :authenticate_user!, only: :sign_out

    def sign_in
      user = User.find_by email: sign_in_params[:email]
      return handle_error! :user_not_found unless user
      return login_failure unless user && user.authenticate(sign_in_params[:password])
      auth_token = AuthToken.generate! user
      process_user_token_and_response auth_token
    end

    def sign_out
      @auth_token.destroy
    end

    private
    def sign_in_params
      params.permit :email, :password
    end

    def login_failure
      handle_error! :unauthenticated
    end
  end
end
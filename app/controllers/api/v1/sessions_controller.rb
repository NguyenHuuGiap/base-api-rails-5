module Api::V1
  class SessionsController < ApiController
    before_action :authenticate_account!, only: :sign_out
    include SwaggerDocs::Sessions

    def sign_in
      account = Account.find_by email: sign_in_params[:email]
      return handle_error! :account_not_found unless account
      return login_failure unless account&.authenticate(sign_in_params[:password])

      auth_token = AuthToken.generate! account
      process_account_token_and_response auth_token
    end

    def sign_out
      handle_error! :sign_out_success if @auth_token.destroy
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

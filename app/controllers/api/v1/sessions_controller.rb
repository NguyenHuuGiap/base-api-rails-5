module Api::V1
  class SessionsController < ApiController
    before_action :authenticate_account!, only: :sign_out
    include SwaggerDocs::Sessions

    def sign_in
      auth_token = SignIn.perform! sign_in_params
      process_account_token_and_response auth_token
    end

    def sign_out
      @auth_token.destroy
    end

    private
    def sign_in_params
      params.permit :account, :password
    end
  end
end

module Api::V1
  class AccountsController < ApiController
    include SwaggerDocs::Accounts

    def create
      auth_token = SignUp.perform! account_params
      process_account_token_and_response auth_token
    end

    private
    def account_params
      params.permit :account, :password, :password_confirmation
    end
  end
end

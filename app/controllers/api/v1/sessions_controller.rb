module Api::V1
  class SessionsController < ApiController
    include SwaggerDocs::Sessions

    def sign_in
      raise ApiError::MissingEmail if params[:email].blank?

      raise ApiError::MissingPassword if params[:password].blank?

      account = Account.find_by email: account_params[:email]
      raise ApiError::AccountNotFound unless account

      raise ApiError::AccountDeactive unless account.active?

      raise ApiError::LoginWrong unless account&.authenticate(account_params[:password])

      process_account_token_and_response account
    end

    def sign_up
      raise ApiError::MissingEmail if params[:email].blank?

      raise ApiError::MissingPassword if params[:password].blank?

      raise ApiError::MissingPasswordConfirmation if params[:password_confirmation].blank?

      ActiveRecord::Base.transaction do
        account = Account.create! account_params
        AuthToken.generate! account
        SignUpWorker.perform_async account.id
      end
    end

    def verify_account
      account = Account.find_by email: params[:email]

      raise ApiError::MissingEmail if params[:email].blank? || account.blank?

      auth_token = AuthToken.find_by token: params[:auth_code]

      raise ApiError::TokenNotFound if params[:auth_code].blank? || auth_token.blank?

      ActiveRecord::Base.transaction do
        account.update! state: "active"
        auth_token.destroy!
      end

      process_account_token_and_response account
    end

    def forgot_password
      raise ApiError::MissingEmail if params[:email].blank?

      account = Account.find_by email: account_params[:email]
      raise ApiError::EmailNotFound unless account

      AuthToken.generate! account
      ResetPasswordWorker.perform_async account.id
    end

    def password_reset
      account = PasswordReset.perform! password_reset_params
      process_account_token_and_response account
    end

    private
    def account_params
      params.permit :email, :password, :password_confirmation
    end

    def password_reset_params
      params.permit :password, :password_confirmation, :auth_code
    end
  end
end

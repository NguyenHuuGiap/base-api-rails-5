module SwaggerDocs::Sessions
  extend ActiveSupport::Concern

  included do
    swagger_controller :sessions, "Sessions"

    swagger_api :sign_in do
      summary "Account sign in"
      notes "Account sign in"
      param :form, "email", :string, :required, "Email"
      param :form, "password", :string, :required, "Password"
      response :unauthorized
      response :not_acceptable
      response :unprocessable_entity
    end

    swagger_api :sign_up do
      summary "Register account"
      notes "Create account with state deactive & send auth token to email register"
      param :form, "email", :string, :required, "Email"
      param :form, "password", :string, :required, "Password"
      param :form, "password_confirmation", :string, :required, "Password confirmation"
      response :no_content
      response :not_acceptable
      response :unprocessable_entity
    end

    swagger_api :verify_account do
      summary "Verify token send mail"
      notes "After request create account & reciver email, user enter auth token verify account"
      param :form, "email", :string, :required, "email (app hidden handle)"
      param :form, "auth_code", :string, :required, "Auth Code"
      response :no_content
      response :auth_token_not_found
      response :account_not_found
      response :not_acceptable
      response :unprocessable_entity
    end

    swagger_api :forgot_password do
      summary "Account forgot password"
      notes "Account enter email request sent mail auth code"
      param :form, "email", :string, :required, "Email"
      response :no_content
      response :not_acceptable
      response :unprocessable_entity
    end

    swagger_api :password_reset do
      summary "Account Password Reset"
      notes "After request forgot password redirect password reset screen"
      param :form, "password", :string, :required, "Password"
      param :form, "password_confirmation", :string, :required, "Password confirmation"
      param :form, "auth_code", :string, :required, "Auth Code"
      response :no_content
      response :password_not_found
      response :auth_token_not_found
      response :account_not_found
      response :not_acceptable
      response :unprocessable_entity
    end
  end
end

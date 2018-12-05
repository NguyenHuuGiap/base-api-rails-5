module Api::V1
  class UsersController < ApiController
    swagger_controller :users, "User Management"

    def create
      auth_token = SignUp.perform! user_params
      process_user_token_and_response auth_token
    end

    private
    def user_params
      params.permit :name, :email, :password, :password_confirmation
    end
  end
end 
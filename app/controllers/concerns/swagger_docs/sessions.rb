module SwaggerDocs::Sessions
  extend ActiveSupport::Concern

  included do
    swagger_controller :sessions, "Sessions"

    swagger_api :sign_in do
      summary "Account sign in"
      notes "Account sign in"
      param :form, "account", :string, :required, "Account"
      param :form, "password", :string, :required, "Password"
      response :unauthorized
      response :not_acceptable
      response :unprocessable_entity
    end

    swagger_api :sign_out do
      summary "Account sign out"
      notes "Account sign out"
      param :header, "X-Auth-Token", :string, :required, "Authentication token"
      response :unauthorized
    end
  end
end

module SwaggerDocs::Accounts
  extend ActiveSupport::Concern

  included do
    swagger_controller :accounts, "Account Management"

    swagger_api :create do
      summary "Create a new Account item"
      notes "Notes for creating a new Account item"
      param :form, "account", :string, :required, "Account"
      param :form, "password", :string, :required, "Password"
      param :form, "password_confirmation", :string, :required, "Password confirmation"
      response :unauthorized
      response :not_acceptable
      response :unprocessable_entity
    end

    swagger_model :Account do
      description "A Account object."
      property :id, :integer, :required, "Account Id"
      property :account, :string, :optional, "Account"
    end
  end
end

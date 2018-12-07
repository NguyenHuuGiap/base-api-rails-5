module Api::V1
  class ApiController < ApplicationController
    Swagger::Docs::Generator.set_real_methods
    include Swagger::Docs::ImpotentMethods

    private
    def process_account_token_and_response auth_token
      raise ApiError::AuthTokenNotFound unless auth_token

      account = auth_token.account
      json_response(:created, nil, token: auth_token.token, exp: auth_token.expired_at,
        account: AccountSerializer.new(account))
    end
  end
end

module Api::V1
  class ApiController < ApplicationController
    Swagger::Docs::Generator.set_real_methods
    include Swagger::Docs::ImpotentMethods

    private
    def process_account_token_and_response account
      authen_token = JsonWebToken.encode generate_attr(account)

      json_response(:created, token: authen_token, exp: Time.zone.at(JsonWebToken.meta[:exp]),
        account: AccountSerializer.new(account))
    end

    def collection_serializer data, model, scope = {}
      ActiveModelSerializers::SerializableResource.new(data,
        adapter: :attributes, scope: scope, each_serializer: model)
    end

    def generate_attr account
      {
        account_id: account.id, email: account.email
      }
    end
  end
end

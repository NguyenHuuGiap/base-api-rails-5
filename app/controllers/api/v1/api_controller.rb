module Api::V1
  class ApiController < ApplicationController
    Swagger::Docs::Generator::set_real_methods
    include Swagger::Docs::ImpotentMethods

    class << self
      Swagger::Docs::Generator::set_real_methods

      def inherited(subclass)
        super
        subclass.class_eval do
          setup_basic_api_documentation
        end
      end

      private
      def setup_basic_api_documentation
        [:index, :show, :create, :update, :delete].each do |api_action|
          swagger_api api_action do
            param :header, 'Authorization', :string, :required, 'Authentication token'
          end
        end
      end
    end

    private
    def process_user_token_and_response auth_token
      return handle_error! :auth_token_not_found unless auth_token
      user = auth_token.user
      json_response(:created, nil, {token: auth_token.token, exp: auth_token.expired_at, user: UserSerializer.new(user)})
    end
  end
end
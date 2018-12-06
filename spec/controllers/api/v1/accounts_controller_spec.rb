require "rails_helper"

RSpec.describe Api::V1::AccountsController, type: :request do
  describe "POST /sign_up" do
    context "when create account with params missing password" do
      before do
        post "/api/v1/accounts",
          params: {account: "example_account"}
      end

      it "should return 422" do
        expect(response_error_code).to eq 422
        expect(response_error_message).to eq I18n.t "api_error.record_invalid"
        expect(response_body["error"]["details"].keys).to eq ["password", "password_confirmation"]
      end
    end

    context "when create account valid" do
      before do
        post "/api/v1/accounts",
          params: {account: "example_account", password: "Password123", password_confirmation: "Password123"}
      end

      it "should return 201" do
        expect_http_status 201
        expect(response_body["data"]["token"]).to eq Account.last.auth_token.token
        expect(response_body["data"]["account"]["account"]).to eq Account.last.account
      end
    end
  end
end
require "rails_helper"

RSpec.describe Api::V1::SessionsController, type: :request do
  describe "POST /sign_in" do
    let(:account){"example_account"}
    let(:password){"Password123"}
    let!(:account_record){create :account, account: account, password: password}

    context "when login with account not exist" do
      before do
        post "/api/v1/account/sign_in", params: {account: "account_faild", password: password}
      end

      it "should return 400" do
        expect(response_error_code).to eq 400
        expect(response_error_message).to eq I18n.t "api_error.account_not_found"
      end
    end

    context "when login with params invalid" do
      before do
        post "/api/v1/account/sign_in", params: {account: account}
      end

      it "should return 422" do
        expect(response_error_code).to eq 401
        expect(response_error_message).to eq I18n.t "api_error.unauthenticated"
      end
    end

    context "when login valid" do
      before do
        post "/api/v1/account/sign_in", params: {account: account, password: password}
      end

      it "should return 201" do
        expect_http_status 201
        expect(response_body["data"]["token"]).to eq account_record.auth_token.token
        expect(response_body["data"]["account"]["account"]).to eq account
      end
    end
  end
end
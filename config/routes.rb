Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/docs", to: redirect("/api_html/dist/index.html?url=/api_docs/api-docs.json")

  namespace :api do
    namespace :v1 do
      resources :accounts
      scope "account" do
        post "sign_in", to: "sessions#sign_in"
        post "sign_up", to: "sessions#sign_up"
        post "verify_account", to: "sessions#verify_account"
        post "forgot_password", to: "sessions#forgot_password"
        post "password_reset", to: "sessions#password_reset"
      end
    end
  end
end

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/docs", to: redirect("/api_html/dist/index.html?url=/api_docs/api-docs.json")

  namespace :api do
    namespace :v1 do
      resources :accounts
      scope "account" do
        post "sign_in", to: "sessions#sign_in"
        delete "sign_out", to: "sessions#sign_out"
      end
    end
  end
end

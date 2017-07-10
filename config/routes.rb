Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get :health, to: "health#index"

      jsonapi_resources :contacts
    end
  end
end

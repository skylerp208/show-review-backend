Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :reviews, only: [:index, :update]
      resources :shows, only: [:index, :update]
      resources :users, only: [:index]
    end
  end
end

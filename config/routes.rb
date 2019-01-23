Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :reviews, only: [:index, :update, :create, :destroy]
      resources :shows, only: [:index, :update, :show]
      resources :users, only: [:index]
    end
  end
end

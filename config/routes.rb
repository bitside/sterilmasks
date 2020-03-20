Rails.application.routes.draw do
  resources :consumers, only: [:index, :new, :create, :show]
  resources :providers, only: [:index, :new, :create, :show]
end

Rails.application.routes.draw do
  root 'dashboard#index'

  resources :consumers, only: [:index, :new, :create, :show]
  resources :providers, only: [:index, :new, :create, :show]
end

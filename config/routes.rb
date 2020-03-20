Rails.application.routes.draw do
  get 'dashboard/index'
  
  resources :consumers, only: [:index, :new, :create, :show]
  resources :providers, only: [:index, :new, :create, :show]
end

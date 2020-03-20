Rails.application.routes.draw do
  root 'dashboard#index'

  resources :consumers, only: [:index, :new, :create, :show] do
    member do
      get :confirm_email
    end
  end

  resources :providers, only: [:index, :new, :create, :show] do
    member do
      get :confirm_email
    end
  end
end

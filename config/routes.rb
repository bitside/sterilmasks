Rails.application.routes.draw do
  root 'dashboard#index'

  get 'impressum', to: 'dashboard#impressum'
  get 'terms', to: 'dashboard#terms'
  get 'privacy', to: 'dashboard#privacy'

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

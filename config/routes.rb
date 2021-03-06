Rails.application.routes.draw do
  root 'dashboard#index'

  get 'impressum', to: 'dashboard#impressum'
  get 'privacy', to: 'dashboard#privacy'
  get 'about', to: 'dashboard#about'
  get 'faq', to: 'dashboard#faq'

  resources :users, only: [] do
    member do
      get :confirm_email
      get :manage_account
    end
  end

  resources :consumers, only: [:index, :new, :create, :show, :edit, :update, :destroy]
  resources :providers, only: [:index, :new, :create, :show, :edit, :update, :destroy]
end

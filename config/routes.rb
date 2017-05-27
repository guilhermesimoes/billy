Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  devise_for :users, skip: [
    :sessions,
    :registrations,
    :passwords
  ]

  devise_scope :user do
    get 'login' => 'devise/sessions#new', as: :new_user_session
    post 'login' => 'devise/sessions#create', as: :user_session
    delete 'logout' => 'devise/sessions#destroy', as: :destroy_user_session

    get 'account-recovery' => 'devise/passwords#new', as: :new_user_password
    post 'account-recovery' => 'devise/passwords#create', as: :user_password
    get 'reset-password' => 'devise/passwords#edit', as: :reset_user_password
    patch 'reset-password' => 'devise/passwords#update', as: :confirm_user_password


    get 'signup' => 'devise/registrations#new', as: :new_user_registration
    post 'signup' => 'devise/registrations#create', as: :user_registration
    get 'change-password' => 'devise/registrations#edit', as: :edit_user_registration
    patch 'change-password' => 'devise/registrations#update', as: :update_user_registration
    delete 'delete-account' => 'devise/registrations#destroy', as: :destroy_user_registration
  end

  resources :home, only: :index

  root to: 'home#index'
end

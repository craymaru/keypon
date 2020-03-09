Rails.application.routes.draw do
  # ROOT
  root "keymaps#search"
  get "settings", :to => "users#settings"
  get "keymaps", :to => "keymaps#search"

  # DEVICES
  devise_for :users, controllers: {
                       registrations: "users/registrations",
                       sessions: "users/sessions",
                     }

  devise_scope :user do
    get "sign_in", :to => "users/sessions#new"
    get "sign_out", :to => "users/sessions#destroy"
  end

  # USERS
  resources :users, only: [:index, :show, :update, :destroy] do
    collection do
      get :settings
    end
  end

  # USERS
  resources :end_users, only: [:show, :edit, :update, :destroy] do
    collection do
      get :confirm
    end
  end

  # KEYMAPS
  resources :keymaps, only: [:index, :show, :new, :edit, :create, :update, :destroy] do
    collection do
      get :search
    end
  end

  # COMMANDS
  resources :commands, only: [:create, :update, :destroy] do
    member do
      patch :recomend_update
    end
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

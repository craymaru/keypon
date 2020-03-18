Rails.application.routes.draw do
  # ROOT
  root "keymaps#search"

  # SHORTNATE
  get "dashboard", :to => "users#dashboard"
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
  resources :users, only: %i[index show update destroy] do
    collection do
      get :dashboard
      get :settings
    end
  end

  # KEYMAPS
  resources :keymaps, only: %i[index show new edit create update destroy], shallow: true do
    resource :favorites, only: %i[create destroy]
    collection do
      get :search
      get :favorites
    end
  end

  # COMMANDS
  resources :commands, only: %i[create update destroy] do
    member do
      patch :recomend_update
    end
  end

  # FAVORITES
  resources :favorites, only: %i[create destroy]

  # RATES
  post "/rate" => "rater#create", :as => "rate"


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

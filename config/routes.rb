Rails.application.routes.draw do
  # TEST
  root "keymaps#search"

  resources :keymaps, only: [:index, :show, :new, :edit, :create, :update, :destroy] do
    collection do
      get :search
    end
  end

  resources :commands, only: [:create, :update, :destroy] do
    member do
      patch :recomend_update
    end
  end

  devise_for :users, controllers: {
                       registrations: "users/registrations",
                       sessions: "users/sessions",
                     }

  devise_scope :user do
    get "sign_in", :to => "users/sessions#new"
    get "sign_out", :to => "users/sessions#destroy"
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

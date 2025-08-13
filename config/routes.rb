Rails.application.routes.draw do
  resource :session
  resources :users
  # Home page
  root "pages#home"

  # login
  get "login", to: "sessions#new"

  # form to register
  get "register", to: "users#new"

  # Password reset flow
  resources :passwords, param: :token

  # Products CRUD
  resources :products
end

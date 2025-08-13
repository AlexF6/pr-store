Rails.application.routes.draw do
  # Home page
  root "pages#home"

  # Sessions (login/logout)
  get    "login",  to: "sessions#new"     # form to log in
  post   "login",  to: "sessions#create"  # submit login form
  delete "logout", to: "sessions#destroy" # log out

  # Registrations (sign up)
  get  "sign_up", to: "registrations#new"    # form to register
  post "sign_up", to: "registrations#create" # submit registration form

  # Users (profiles, edit account)
  resources :users, only: [ :show, :edit, :update, :destroy ]

  # Password reset flow
  resources :passwords, param: :token

  # Products CRUD
  resources :products
end

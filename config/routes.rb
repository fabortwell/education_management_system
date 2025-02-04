Rails.application.routes.draw do
  devise_for :users, path: "", path_names: {
    sign_in: "login",
    sign_out: "logout",
    registration: "signup"
  }

  root "pages#home"


  resource :dashboard, only: [ :show ]
  resources :users, only: [ :index, :edit, :update, :destroy ]
  resources :courses
  resources :announcements
  resources :financial_statements
end

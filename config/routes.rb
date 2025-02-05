Rails.application.routes.draw do
  get "courses/index"
  devise_for :users, path: "", path_names: {
    sign_in: "login",
    sign_out: "logout",
    registration: "signup"
  }

  authenticated :user do
    root to: "dashboards#show", as: :authenticated_root
  end

  unauthenticated do
    root to: "pages#home"
  end

  resource :dashboard, only: [ :show ]



  resources :courses, only: [ :index ]
  resource :dashboard, only: [ :show ]
  resources :users, only: [ :index, :edit, :update, :destroy ]
  resources :announcements
  resources :financial_statements
end

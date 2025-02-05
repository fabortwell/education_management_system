Rails.application.routes.draw do
  get "courses/index"
  devise_for :users, path: "", path_names: {
    sign_in: "login",
    sign_out: "logout",
    registration: "signup"
  }

  root to: "dashboards#show", as: :authenticated_root
  # Define specific routes for admin and student dashboards
  get "admin_dashboard", to: "dashboards#admin", as: "admin_dashboard"
  get "student_dashboard", to: "dashboards#student", as: "student_dashboard"

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

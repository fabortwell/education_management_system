Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: "users/sessions"
  }
  # Define the home page for unauthenticated users
  root to: "pages#home", as: :unauthenticated_root

  # Define routes for authenticated users
  authenticate :user do
    root to: "dashboards#show", as: :authenticated_root
    get "admin_dashboard", to: "dashboards#admin", as: "admin_dashboard"
    get "student_dashboard", to: "dashboards#student", as: "student_dashboard"
    resource :dashboard, only: [ :show ]
  end

  # Other resources
  resources :courses, only: [ :index ]
  resources :users, only: [ :index, :edit, :update, :destroy ]
  resources :announcements
  resources :financial_statements
end

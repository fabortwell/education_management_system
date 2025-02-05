Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: "users/sessions"
  }

  root to: "pages#home", as: :unauthenticated_root


  authenticate :user do
    root to: "dashboards#show", as: :authenticated_root
    get "admin_dashboard", to: "dashboards#admin", as: "admin_dashboard"
    get "student_dashboard", to: "dashboards#student", as: "student_dashboard"
    resource :dashboard, only: [ :show ]
  end

  post "courses/:id/enroll", to: "courses#enroll", as: :enroll_course
  resources :courses, only: [ :index ]
  resources :users, only: [ :index, :edit, :update, :destroy ]
  resources :announcements
  resources :financial_statements
end

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root "home#index", as: :home

  get "/dashboard", to: "dashboard#index", as: :dashboard
  get "/search", to: "search#index"
  get "/schedule", to: "schedule#index", as: :schedule

  resources :patients
  resources :users
  put "/users/:id/verify", to: "users#verify", as: :verify_user
  # for assigning a users to a facility
  put "/assign", to: "users#assign_facility", as: :assign_facility
  # for removing a users from a facility
  put "/unassign", to: "users#unassign_facility", as: :unassign_facility

  # get "/patients/:id/view/details/edit", to: "patients#family_details", as: :patient_details

  get "/signup", to: "users#signup", as: :signup

  get "/password_reset", to: "password_reset#index", as: "password_reset_page"
  post "/password_reset", to: "password_reset#options"
  post "/password_reset/send_otp", to: "password_reset#send_otp"
  post "/password_reset/verify", to: "password_reset#verify"
  post "/password_reset/update", to: "password_reset#update"

  resources :sessions
  resources :facilities
  # get users belonging to a facility
  get "/facilities/:id/users", to: "facilities#show_users", as: :show_facility_users
  resources :lsg_bodies
  resources :wards
end

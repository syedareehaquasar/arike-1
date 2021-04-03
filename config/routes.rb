Rails
  .application
  .routes
  .draw do
    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

    root 'home#index'

    # for assigning a nurse to a facility
    put '/assign', to: 'users#assign_facility', as: :assign_facility

    # for removing a nurse from a facility
    put '/unassign', to: 'users#unassign_facility', as: :unassign_facility

    # get "/patients/:id/view/details/edit", to: "patients#family_details", as: :patient_details
    get '/dashboard', to: 'dashboard#index', as: :dashboard
    get '/search', to: 'search#index'
    get '/schedule', to: 'schedule#index', as: :schedule
    post '/schedule', to: 'schedule#schedule'

    put '/users/:id/verify', to: 'users#verify', as: :verify_user

    get 'logout', to: 'sessions#logout'

    resources :patients
    resources :users

    # get "/patients/:id/view/details/edit", to: "patients#family_details", as: :patient_details

    get '/signup', to: 'users#signup', as: :signup

    get '/password_reset', to: 'password_reset#index', as: 'password_reset_page'
    post '/password_reset/send_otp', to: 'password_reset#send_otp'
    post '/password_reset/verify', to: 'password_reset#verify'
    post '/password_reset/update', to: 'password_reset#update'

    # visit_details
    get '/visit_details/decision', to: 'visit_details#decision'
    post '/visit_details/assign_to', to: 'visit_details#assign_to'
    post '/visit_details/schedule_revisit', to: 'visit_details#schedule_revisit' 
    post '/visit_details/expired', to: 'visit_details#expired'

    resources :visit_details
    resources :sessions
    resources :facilities
    resources :lsg_bodies
    resources :wards
  end

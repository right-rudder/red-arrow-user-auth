Rails.application.routes.draw do
  resources :documents
  resources :bio_credentials
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  get 'weekly_calendar/show'
  resources :aircrafts
  resources :events
  devise_for :users
  
  root to: "home#index"

  namespace :admin do
     # Add ADMIN routes  example below
    resources :users, only: [:index, :edit, :update]

    resources :users do
      member do
        get 'show_user_profile'
      end
    end
  end

  # Add a route for the user profile
  resource :user, only: [:show, :edit, :update]

  resources :events

  get 'weekly_calendar/show', to: 'weekly_calendar#show', as: :weekly_calendar

end

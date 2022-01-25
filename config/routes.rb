Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get "my_visits", to: "pages#my_visits"
  get "my_rentals", to: "pages#my_rentals"
  resources :coworkings, except: [:index] do
    resources :bookings, only: [:create]
  end
  resources :bookings, only: [:destroy] do
    member do
      patch :confirm
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

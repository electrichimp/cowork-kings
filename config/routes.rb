Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get "my_coworkings", to: "pages#my_coworkings"
  get "my_visits", to: "pages#my_visits"
  get "my_rentals", to: "pages#my_rentals"
  resources :coworkings, except: [:index] do
    resources :bookings, only: [:create]
    resources :reviews,  only: [:create, :new, :destroy]
  end
  resources :bookings, only: [:destroy] do
    collection do

    end
    member do
      patch :confirm
    end

  end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

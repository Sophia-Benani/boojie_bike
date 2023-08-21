Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :bikes, only: [:index, :show, :new, :create] do
    resources :bookings, only: [:index, :new, :create]
    namespace :renter, only: [:index] do
      :bookings
    end
  end
end

Rails.application.routes.draw do
  get 'bookings/index'
  get 'bikes/index'
  get 'bikes/show'
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :bikes, only: [:index, :show, :new, :create] do
    resources :bookings, only: [:index, :new, :create]
  end
  namespace :profile do
    resources :bookings, only: [:index]
    resources :bikes, only: [:index]
  end
end

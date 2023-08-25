Rails.application.routes.draw do
  get 'stimulus/search'
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
  get "search-map-results", to: "bikes#search_map_results", as: "search-map-results"
  namespace :profile do
    resources :bookings, only: [:index, :destroy, :edit, :update]
    resources :bikes, only: [:index, :destroy, :edit, :update]
  end
end

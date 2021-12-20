Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  resources :reservations, only: [:create]
  resources :users
  resources :rooms
  root 'top#index'
  get '/search', to: 'searchs#search'

  resources :rooms do
    collection do
      get 'search'
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

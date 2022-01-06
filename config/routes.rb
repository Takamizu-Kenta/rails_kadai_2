Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  resources :reservations, only: [:create]
  resources :users
  root 'top#index'

  resources :rooms do
    collection do
      get 'search', to: 'rooms#search'
    end
  end
  
  resources :rooms do
    resources :reservasions
  end

  resources :rooms
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

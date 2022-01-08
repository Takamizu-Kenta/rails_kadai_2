Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  resources :reservations, only: [:create]
  resources :users
  
  root 'top#index'
  get 'reservations/new' #入力
  post 'reservations/confirm' #確認
  post 'reservations/back' #戻る
  post 'reservations/complete' #予約完了


  resources :rooms do
    collection do
      get 'search', to: 'rooms#search'
    end
  end
  
  # resources :rooms do
  #   resources :reservasions
  # end

  resources :rooms
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

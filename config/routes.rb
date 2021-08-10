Rails.application.routes.draw do

  resources :homes, only: [:index]
  get 'shops/search'

  resources :shops do
    resources :reviews, only: [:index, :new, :create]
    resources :favorites, only: [:index, :create, :destroy]
    get 'users/favorite'
  end

  devise_for :operations, controllers: {
    sessions:      'operations/sessions',
    registrations: 'operations/registrations'
  }
  devise_for :owners, controllers: {
    sessions:      'owners/sessions',
    registrations: 'owners/registrations'
  }
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations',
  }
  get 'users/show'  


  root to: "homes#index"
end

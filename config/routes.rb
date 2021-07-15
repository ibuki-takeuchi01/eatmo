Rails.application.routes.draw do

  resources :homes, only: [:index]
  get 'shops/search'

  resources :shops do
    resources :reviews, only: [:index, :new, :create]
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
    sessions:      'users/sessions',
    registrations: 'users/registrations'
  }

  root to: "homes#index"
end

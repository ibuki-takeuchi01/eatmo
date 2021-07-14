Rails.application.routes.draw do

  resources :shops do
    resources :reviews, only: [:index, :new, :create]
    resources :homes, only: [:index]
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

Rails.application.routes.draw do

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
  get 'homes/index'
  root to: "homes#index"
end

Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'organisations#index'
  resources :organisations, only: %i[destroy create update edit show index] do
   resources :shifts, only: %i[create new index]
  end
  resources :shifts, only: [:destroy]
end

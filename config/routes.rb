Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'organisations#index'
  resources :organisations, except: %i[new] do
    member do
      patch :leave, :join
    end
   resources :shifts, only: %i[create index destroy edit update]
  end
end

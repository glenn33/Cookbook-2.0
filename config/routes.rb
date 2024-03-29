Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get 'recipies', to: 'pages#recipies'
  get 'recipies/:id', to: 'pages#show', as: :recipie
  resources :bookings, only: [:index, :new, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

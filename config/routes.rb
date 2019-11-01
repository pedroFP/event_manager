Rails.application.routes.draw do

  resources :users, only: [:update, :index]

  resources :events do
    resources :tickets, only: [:index, :create]
  end

  resources :tickets, only: [:index, :show]
  root 'events#index'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

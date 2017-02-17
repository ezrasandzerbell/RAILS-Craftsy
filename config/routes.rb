Rails.application.routes.draw do
  devise_for :users

  resources :products do
    resources :reviews
  end
  get '/show', to: 'home#show', as: 'show'
  
  root to: 'home#index'
end

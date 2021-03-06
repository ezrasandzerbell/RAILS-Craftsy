Rails.application.routes.draw do
  devise_for :users
  resources :users, :only => [:show], :controllers => { :registrations => "users/registrations" }
  resources :products do
    resources :reviews
  end

  root to: 'home#index'
end

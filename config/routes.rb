Rails.application.routes.draw do

  root to: "users#index"


  resources :comments
  resources :pictures
  resources :authors
  resources :books do
    collection { post :import }
  end
  resources :deals
  resources :customers do
    collection { post :import }
  end
  devise_for :users
  resources :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

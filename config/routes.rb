Rails.application.routes.draw do

  devise_for :users

  resources :comments
  resources :authors
  resources :books do
    resources :pictures
    collection { post :import }
  end

  resources :pictures

  root to: "books#index"

  resources :deals
  resources :customers do
    collection { post :import }
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do


  devise_for :users


  resources :authors

  resources :books do
    resources :pictures
    collection { post :import }
  end

  resources :comments

  resources :customers do
    collection { post :import }
  end

  resources :deals
  resources :pictures
  resources :professions
  resources :specialities

  resources :twilio_messages do
    collection do
      get 'send_wa_message', to: 'twilio_messages#create', as: 'send_wa'
    end
  end

  root to: "books#index"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

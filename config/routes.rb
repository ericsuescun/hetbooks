Rails.application.routes.draw do

  devise_for :users

  resources :comments
  resources :authors
  resources :books do
    resources :pictures
    collection { post :import }
  end

  resources :pictures

  resources :twilio_messages do
    collection do
      get 'send_wa_message', to: 'twilio_messages#create', as: 'send_wa'
    end
  end

  root to: "books#index"

  resources :deals
  resources :customers do
    collection { post :import }
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do
  resources :addresses
  devise_for :users
  resources :users, only: [:index, :show, :edit, :update]
  devise_scope :user do
    authenticated :user do
      # root to: 'pages#index'
    end
    unauthenticated :user do
      root 'devise/sessions#new' 
    end
  end
  resources :address, only: [:edit, :update]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

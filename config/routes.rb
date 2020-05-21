Rails.application.routes.draw do
  get 'friends/index'
  root to: 'users#login'

  resources :comments, only: [:index, :new, :create, :show, :destroy]
  resources :replies, only: [:new, :create, :destroy]
  resources :friends, only: [:index, :show, :create, :destroy]

  resources :fites, only: [:destroy]  do
    member do
      post :create
    end
  end
  
  resources :users do
    collection do
      get :login
      post :loginpage
      post :logout
    end
  
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

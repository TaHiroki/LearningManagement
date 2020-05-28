Rails.application.routes.draw do
  root to: 'users#login'

  resources :comments, only: [:index, :new, :create, :show, :destroy]
  resources :replies, only: [:new, :create, :destroy]
  resources :subjects

  resources :friends, except: [:create, :update] do
    member do
      post :create
    end
  end

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
      get :easylogin
      get :use
      post :boxsave
    end
  
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

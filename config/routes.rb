Rails.application.routes.draw do
  root to: 'users#login'
  resources :comments, only: [:index, :new, :show]
  resources :replies, only: [:new]
  resources :users do
    collection do
      get :login
      post :loginpage
      post :logout
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

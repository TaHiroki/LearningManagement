Rails.application.routes.draw do
  get 'replys/index'
  root to: 'users#index'
  resources :comments
  resources :users do
    collection do
      get :login
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do
  get 'comments/index'
  root to: 'users#index'
  resources :users do
    collection do
      get :login
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

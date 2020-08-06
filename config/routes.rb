Rails.application.routes.draw do
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
  get 'dynamic_pages/welcome'
  get 'index', to: 'static_pages#index'
  get 'team', to: 'static_pages#team'
  get 'contact', to: 'static_pages#contact'

  resources :cities
  resources :users
  resources :gossips do
    resources :comments
  end
  resources :sessions, only:[:new, :create, :destroy]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

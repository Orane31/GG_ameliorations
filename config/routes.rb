Rails.application.routes.draw do
  get 'dynamic_pages/welcome'
  get 'index', to: 'static_pages#index'
  get 'team', to: 'static_pages#team'
  get 'contact', to: 'static_pages#contact'
  
  get 'gossips/index'
  get 'gossips/show'
  get 'gossips/new'
  get 'gossips/create'
  get 'gossips/edit'
  get 'gossips/update'
  get 'gossips/destroy'
  get 'cities/show', to: 'cities#show'
  get 'users/show', to: 'users#show'
#  get 'city/show', to: 'cities#show'

  resources :gossips

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

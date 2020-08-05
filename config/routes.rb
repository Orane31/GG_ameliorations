Rails.application.routes.draw do
  get 'city/show'
  get 'user/show'
  get 'dynamic_pages/welcome'
  get 'index', to: 'static_pages#index'
  get 'team', to: 'static_pages#team'
  get 'contact', to: 'static_pages#contact'
  get 'gossip/index'
  get 'gossip/show'
  get 'gossip/new'
  get 'gossip/create'
  get 'gossip/edit'
  get 'gossip/update'
  get 'gossip/destroy'

  resources :gossips
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do
  

  devise_for :users, path: '', path_name: { sign_in: 'login', sign_out: 'logout'}
  resources :users
  resources :products
  resources :orders, only: [:index, :show, :create, :destroy]
  get 'static_pages/about'

  get 'static_pages/contact'

  get 'static_pages/index'
  
  get 'static_pages/landing_page'

  get 'users/new'

  root 'products#index'

  post 'static_pages/thank_you'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do

  get 'dashboard/profile'
  resources :gossips

  resources :author

  resources :welcome

  resources :cities

  resources :sessions

  root 'gossips#index'

  get 'staticpage/contact_us', to: 'static_pages#contact_us'

  get 'staticpage/home', to: 'static_pages#home'

  get 'dashboard/profile', to: 'dashboard#profile'



end

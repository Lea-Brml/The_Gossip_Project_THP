Rails.application.routes.draw do

  resources :gossips

  resources :author

  resources :welcome

  resources :cities

  root 'gossips#index'

  get 'staticpage/contact_us', to: 'static_pages#contact_us'

  get 'staticpage/home', to: 'static_pages#home'



end

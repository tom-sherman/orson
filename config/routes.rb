Rails.application.routes.draw do
  resources :media
  resources :libraries
  get 'pages', to: 'pages#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

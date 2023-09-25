Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations', sessions: 'users/sessions' }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :delivery_partners
  resources :packages
  resources :shipments

  # Defines the root path route ("/")
  root 'packages#index'
end

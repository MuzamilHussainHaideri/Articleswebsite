Rails.application.routes.draw do
  resources :articles do
  	resources :comments
  end
  resources :contacts
  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :articles
  root to: 'pages#index'
  get 'pages/contact'
  get 'pages/about'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end

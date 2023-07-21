Rails.application.routes.draw do
  resources :comments
  resources :pictures
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get '/my_pictures', to: 'pictures#user_pictures', as: :user_pictures
  resources :pictures do
    resources :comments, only: :create
  end
  # Defines the root path route ("/")
  root "pictures#index"
end

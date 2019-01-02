Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users
  get '/signin', to: "sessions#new"
  get '/signup', to: "users#new"
  post '/signin', to: "sessions#create"
  delete '/logout', to: "sessions#destroy"
  resources :posts, only: [:new,:index,:create]
end

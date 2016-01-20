Rails.application.routes.draw do
 root to: "static_pages#homepage"

 resources :users
 resources :entries

 get "/login", to: "sessions#new"
 resources :sessions, only: [:create]
 get "/signup", to: "users#new"
 get "/logout", to: "sessions#destroy"

end

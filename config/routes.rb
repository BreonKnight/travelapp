Rails.application.routes.draw do
 root to: "cities#index"

 get "/profile", to: "users#show"

 resources :users
 resources :cities, except: [:index] do
   resources :entries
 end

 get "/login", to: "sessions#new"

 resources :sessions, only: [:create]
 get "/signup", to: "users#new"
 get "/logout", to: "sessions#destroy"

end

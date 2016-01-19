Rails.application.routes.draw do
 root to: "static_pages#homepage"

 resources :users do
 resources :entries
 end

end

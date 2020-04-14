Rails.application.routes.draw do
  resources :orders
  resources :items
  devise_for :customers
  root to: "items#index"
end

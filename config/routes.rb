Rails.application.routes.draw do
  resources :items
  devise_for :customers
  root to: "items#index"
end

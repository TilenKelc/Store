Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :orders, only: [:index, :show, :edit, :create, :update]
  resources :items
  devise_for :customers
  root to: "items#index"
  get "orders/:id/new/" => "orders#new", :as => :new_order
end

Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :orders, only: [:index, :show, :edit, :create]
  resources :items
  devise_for :customers
  root to: "items#index"
  get "orders/:id/new/" => "orders#new", :as => :new_order
  get 'order/git status
  card_payment' => 'orders#card_payment', as: :card_payment

end

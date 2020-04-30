Rails.application.routes.draw do
  get "mail/send_mail" => "mail#send_mail", :as => :send_mail
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :orders, only: [:index, :show, :edit, :create, :update]
  resources :items
  devise_for :customers
  root to: "items#index"
  get "orders/:id/new/" => "orders#new", :as => :new_order

  scope "/checkout" do
    post "create", to: "checkout#create", as: "checkout_create"
    get ":id/success", to: "checkout#success", as: "checkout_success"
    get "cancel", to: "checkout#cancel", as: "checkout_cancel"
  end
end

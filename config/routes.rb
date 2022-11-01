Rails.application.routes.draw do
  namespace :public do
    get 'items/index'
    get 'items/show'
  end
  #顧客用
  devise_for :customers,skip: [:passwords],controllers:{
    registrations: "public/registrations",
    sessions: "public/sessions"
  }

  #管理者用
  devise_for :admin,skip: [:registrations, :passwords],controllers:{
    sessions: "admin/sessions",
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to:'public/homes#top'
  get'about' => 'public/homes#about'
  get'customers/my_page' => 'public/customers#show',as: :customer
  get'customers/information/edit' => 'public/customers#edit',as: :edit_customer
  patch 'customers/information' => 'public/customers#edit',as: :update_customer
  get'customers/unsubscribe' => 'public/customers#subscribe',as: :subscribe_customer
  patch 'customers/withdrawal' => 'public/customers#withdrawal',as: :withdrawal_customer
  delete'cart_items/destroy_all' => 'public/cart_items#destroy_all'
  get 'orders/end' => 'public/orders#end'
  post'orders/confirm' => 'public/orders#confirm'

  scope module: :public do
    resources :addresses,only: [:index,:edit,:create,:update,:destroy]
    resources :items,only: [:index,:show]
    resources :cart_items,only: [:index,:update,:destroy,:create]
    resources :orders,only: [:new,:index,:show,:create]
  end

  namespace :admin do
    resources :genres,only: [:index,:edit,:create,:update]
    resources :items,only: [:index,:edit,:new,:create,:update]
    resources :orders,only: [:top,:show,:update]
    resources :order_details,only: [:update]
    resources :customers
    root to:'homes#top'
  end

end

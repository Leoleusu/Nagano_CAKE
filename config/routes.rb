Rails.application.routes.draw do
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
  get'about' => 'public/homes/about'
  namespace :admin do
    resources :genres,only: [:index,:edit,:create,:update]
    resources :items,only: [:index,:edit,:new,:create,:update]
    resources :orders,only: [:top]
    resources :customers
    root to:'homes#top'
  end
end

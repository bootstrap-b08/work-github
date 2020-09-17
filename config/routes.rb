Rails.application.routes.draw do
  devise_for :customers
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  #admin
  namespace :admin do
    root 'homes#top'
    resources :customer, only: [:show, :index, :edit, :update]
    resources :items, except: [:destroy]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :orders, only: [:index, :show]
    patch '/orders/:id/order_status' => 'orders#order_status_update', as: "order_status" # 注文ステータスupdate
    patch '/orders/:id/item_status' => 'orders#item_status_update', as: "item_status" # 製作ステータスupdate
  end

  #customer
  scope module: :customers do
  root 'homes#top'
  get '/thanks' => 'homes#thanks' #サンクスページ

  resources :customers, only: [:show, :edit, :update]
  get '/customers/:id/unsubscribe' => 'customers#unsubscribe', as: 'unsubscribe_customer' #退会画面への遷移
  patch '/customers/:id/withdrow' => 'customers#withdraw', as: 'withdrow_customer' #会員ステータスの切替

  resources :addresses, except: [:new, :show]

  resources :orders, except: [:edit, :update, :destroy]
  post '/orders/confirm' => 'orders#confirm', as: 'orders_confirm' #注文情報確認画面
  get '/orders/item_view' => 'orders#item_view' #注文詳細画面を表示する

  resources :cart_items, except: [:new, :show, :edit]
  delete '/cart_items' => 'cart_items#destroy_all' #カートアイテムを全て削除

  resources :items, only: [:index, :show]
  resources :genres, only: [:index]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
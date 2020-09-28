Rails.application.routes.draw do

  #adminss
  scope module: :admins do
    devise_for :admins
  end
  namespace :admins do
    root 'homes#top'
    resources :customers, only: [:show, :index, :edit, :update]
    resources :items, except: [:destroy]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :orders, only: [:index, :show]
    patch '/orders/:id/order_status' => 'orders#order_status_update', as: "order_status" # 注文ステータスupdate
    patch '/orders/:id/product_status' => 'orders#product_status_update', as: "product_status" # 製作ステータスupdate
    get '/today/orders' => 'orders#index', as: "today_orders" # TOP,本日受注した注文数 => 注文履歴の表示データ用
    get '/searches' => 'searches#search'
    get '/:id/orders' => 'orders#index', as: "orders_customer"
  end

  #customer
  scope module: :customers do
    root 'homes#top'
    get '/homes/about' => 'homes#about' #サンクスページ

    devise_for :customers, :skip => [:registrations]
    #devise editとshowはcustomersコントローラで管理したいため
    devise_scope :customer do
      get 'customers/sign_up' => 'registrations#new', as: 'new_customers_registration'
      post 'customers/sign_up' => 'registrations#create', as: 'customers_registration'
      get 'customers/registration_edit' => 'registrations#edit', as: 'edit_customer_registration'
    end
    resource :customers, only: [:show, :edit, :update ,:create]
    get '/customers/unsubscribe' => 'customers#unsubscribe', as: 'unsubscribe_customer' #退会画面への遷移
    patch '/customers/withdraw' => 'customers#withdraw', as: 'withdraw_customer' #会員ステータスの切替
    resources :addresses, except: [:new, :show]

    resources :orders, except: [:edit, :update, :destroy]
    post '/orders/confirm' => 'orders#confirm', as: 'orders_confirm' #注文情報確認画面
    get '/orders/item_view' => 'orders#item_view' #注文詳細画面を表示する
    get '/thanks' => 'orders#thanks' #サンクスページ

    resources :cart_items, except: [:new, :show, :edit]
    delete '/cart_items' => 'cart_items#destroy_all' #カートアイテムを全て削除

    resources :items, only: [:index, :show]
    resources :genres, only: [:index] do
    resources :items, only: [:index]
  end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
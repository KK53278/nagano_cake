Rails.application.routes.draw do

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :admins, controllers: {
    sessions: 'admin/sessions',
  }

  namespace :admin do
  get "top" => "homes#top", as: "top"
  resources :items, except: [:destroy]
  resources :genres, only: [:index, :create, :edit, :update]
  resources :customers, only: [:index, :show, :edit, :update]
  resources :orders, only: [:index, :show, :update] do
    resources :order_details, only: [:update]
  end
end

  devise_for :customers, controllers: {
    sessions: 'public/sessions',
    passwords:     'public/passwords',
    registrations: 'public/registrations',
  }

  scope module: :public do
    root 'homes#top'

  get 'customers/mypage' => 'customers#show', as: 'mypage'
  # customers/editのようにするとdeviseのルーティングとかぶってしまうためinformationを付け加えている。
  get 'customers/information/edit' => 'customers#edit', as: 'edit_information'
  patch 'customers/information' => 'customers#update', as: 'update_information'
  get 'customers/unsubscribe' => 'customers#unsubscribe', as: 'confirm_unsubscribe'
  put 'customers/information' => 'customers#update'
  patch 'customers/withdraw' => 'customers#withdraw', as: 'withdraw_customer'
  delete 'cart_items/destroy_all' => 'cart_items#destroy_all', as: 'destroy_all_cart_items'
  post 'orders/confirm' => 'orders#confirm'
  get 'orders/confirm' => 'orders#error'
  get 'orders/thanks' => 'orders#thanks', as: 'thanks'

  resources :items, only: [:index, :show] do
    resources :cart_items, only: [:create, :update, :destroy]
  end
  resources :cart_items, only: [:index]
  resources :orders, only: [:new, :index, :create, :show]
  resources :addresses, only: [:index, :create, :edit, :update, :destroy]

  end

end


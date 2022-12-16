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
  resources :orders, only: [:show, :update] do
    resources :order_details, only: [:update]
  end
end

  devise_for :customers, controllers: {
    sessions: 'public/sessions',
    passwords:     'public/passwords',
    registrations: 'public/registrations',
  }

  scope module: :public do

  resources :addresses, only: [:index, :create, :edit, :update, :destroy]
  resources :cart_items, only: [:index, :create, :update, :destroy]

  end



end


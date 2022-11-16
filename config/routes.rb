Rails.application.routes.draw do
  
  devise_for :customers, controllers: {
    sessions: 'public/sessions',
    passwords:     'public/passwords',
    registrations: 'public/registrations',
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :admins, controllers: {
    sessions: 'admin/sessions',
    passwords:     'admin/passwords',
    registrations: 'admin/registrations'
  }
  
  namespace :admin do
  get "top" => "homes#top", as: "top"
  resources :items, except: [:destroy]
end
  
end


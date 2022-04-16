Rails.application.routes.draw do
 root to: "homes#top"
 devise_for :users

 resources :books, only: [:edit, :new, :index, :show, :create, :destroy, :update]
 resources :users, only: [:edit, :show, :update, :index]



 get 'homes/about' => 'homes#about', as:'about'
 # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

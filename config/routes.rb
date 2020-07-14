Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'toppages#index'
  
  get 'toppages/about', to: 'toppages#about'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  get 'signup', to: 'users#new'
  resources :users, only: [:show, :new, :create, :edit, :update]
  
  resources :items do
    resources :comments, only: [:create, :destroy]
  end
  
  # メッセージ
  resources :messages, :only => [:create]
  resources :rooms, :only => [:create, :show, :destroy]
  # 通知
  resources :notifications, only: [:index, :destroy]
end

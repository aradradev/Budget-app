Rails.application.routes.draw do
  root 'splash#index'
  resources :categories do
    resources :purchases, only: [:new, :show, :destroy]
  end
  resources :purchases, except: [:new, :show, :index]
  devise_for :users
end

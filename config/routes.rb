Rails.application.routes.draw do
  devise_for :users
  resources :books, except: [:new]
  resources :users, only: [:index, :show, :edit, :update]
end

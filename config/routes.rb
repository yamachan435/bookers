Rails.application.routes.draw do
  root 'home#top'
  devise_for :users
  resources :books, except: [:new]
  resources :users, only: [:index, :show, :edit, :update]
  get '/home/about', to: 'home#about'
end

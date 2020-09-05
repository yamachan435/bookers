Rails.application.routes.draw do
  root 'home#top'
  devise_for :users
  resources :books, except: [:new] do
    scope module: :books do
      resources :favorites, only: [:index] do
        get 'pickup', on: :collection
      end
      resource :favorite, only: [:create, :destroy]
    end
  end
  resources :users, only: [:index, :show, :edit, :update]
  get '/home/about', to: 'home#about'
end

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'songs#index'
  resources :songs, only: [:index]

  resources :artists, only: [:new, :create, :index], shallow: true do
    resources :songs, only: [:show, :new, :create]
  end

  resources :playlists, only: [:new, :create, :show]
  resources :users, only: [:new, :create, :show]

  namespace :admin do
    resources :categories, only: :index
  end

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  delete '/logout', to: 'sessions#destroy'

end

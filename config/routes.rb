Rails.application.routes.draw do
  get 'reviews/new'
  # get 'bookmark/new'
  # get 'bookmark/create'
  # get 'bookmark/destroy'
  # get 'lists/index'
  # get 'lists/show'
  # get 'lists/new'
  # get 'lists/create'
  resources :lists, except: [:edit, :update] do
    resources :bookmarks, only: [:new,:create]
    resources :reviews, only: :create
  end

  resources :bookmarks, only: [:destroy]
  resources :lists, only: [:destroy]
  resources :reviews, only: [:destroy]

  # Defines the root path route ("/")
  root "lists#index"
end

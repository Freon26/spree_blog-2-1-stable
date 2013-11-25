Spree::Core::Engine.routes.draw do

  namespace :blog do
    match '/', to: 'contents#index', as: 'index'
    match '/:slug', to: 'contents#show', as: 'content'
  end

  namespace :api do
    resources :posts
    resources :tags
  end

  namespace :admin do
    resources :authors
    resources :categories
    resources :posts
    resources :tags
  end
end

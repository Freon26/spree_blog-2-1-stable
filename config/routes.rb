Spree::Core::Engine.routes.draw do

  namespace :blog do
    get '/', to: 'contents#index', as: 'index'
    get '/:slug', to: 'contents#show', as: 'content'
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

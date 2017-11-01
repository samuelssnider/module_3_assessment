Rails.application.routes.draw do
  root 'items#index'
  
  get '/search', to: 'search#index'

  namespace :api do
    namespace :v1 do
      resources :items
    end
  end

  resources :items,  only: [:index, :show]
  resources :orders, only: [:index, :show]
  resources :users,  only: [:index, :show]
end

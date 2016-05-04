Rails.application.routes.draw do
  
  root to: 'dashboard#index'

  devise_for :users

  resources :messages, only: [:new, :create]
  resources :categories
  resources :groups
  resources :users do
    collection do
      post 'set_group'
      post 'remove_group'
    end
  end

end

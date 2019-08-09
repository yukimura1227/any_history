# frozen_string_literal: true

Rails.application.routes.draw do
  resources :tags
  resources :images
  resources :events
  resources :categories
  resources :chronologies do
    collection do
      get 'cards', to: 'chronologies#cards', as: :cards
      get 'view/:token', to: 'chronologies#view', as: :view
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'top#index'
  get 'login' => 'user_sessions#new', :as => :login
  get 'oauth/callback', to: 'oauth#callback'
  get 'oauth/:provider', to: 'oauth#oauth', as: 'auth_at_provider'
  delete 'logout' => 'user_sessions#destroy', :as => :logout
  resources :user_sessions, only: %i[create]

  resources :password_resets, only: %i[new create edit update]

  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
end

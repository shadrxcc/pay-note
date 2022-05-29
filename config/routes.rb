# frozen_string_literal: true

Rails.application.routes.draw do
  resources :items, except: %i[show edit update] do
    get :uncategorized, on: :collection
  end
  resources :groups
  devise_for :users
  root 'home#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  devise_scope :user do
    get 'users/sign_out' => 'devise/sessions#destroy'
  end
  # Defines the root path route ("/")
  # root "articles#index"
end
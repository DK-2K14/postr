require "monban/constraints/signed_in"
require "monban/constraints/signed_out"

Rails.application.routes.draw do

  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create]

  resources :posts, only: [:new, :create, :index, :show] do 
    resources :comments, only: [:create]
    resources :votes, only: [:create, :destroy]
  end

  root "posts#index"
end

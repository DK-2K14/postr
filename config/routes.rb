require "monban/constraints/signed_in"
require "monban/constraints/signed_out"

Rails.application.routes.draw do

  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create]

  resources :posts, only: [] do
    resources :comments, only: [:create]
    resources :upvotes, only: [:create]
    resources :downvotes, only: [:create]
  end

  resources :text_posts, only: [:new, :create, :index, :show]
  resources :link_posts, only: [:new, :create, :index, :show]

  constraints Monban::Constraints::SignedIn.new do
    root "dashboards#show", as: :dashboard
  end

  constraints Monban::Constraints::SignedOut.new do
    root "dashboards#show"
  end

end

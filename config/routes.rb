Rails.application.routes.draw do

  devise_for :experts
  devise_for :novices

  concern :commentable_campaign do
    resources :comments, only: [:index, :new, :create], module: :campaigns
  end

  concern :commentable_todo do
    resources :comments, only: [:index, :new, :create], module: :todos
  end

  resources :users, shallow: true do
    get  'edit_assign' , on: :member
    patch 'assign'
    resources :campaigns, concerns: :commentable_campaign do
        resources :todos, concerns: :commentable_todo
    end
  end

  resources :comments, only: [:edit, :update, :destroy, :show]

  root to: "users#index"
end

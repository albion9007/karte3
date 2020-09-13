Rails.application.routes.draw do
  devise_for :users
  get 'patients/index'
  root to: "patients#index"
  resources :users, only: [:edit, :update]
  resources :patients do
    resources :observations, only: [:new, :create, :edit, :show, :update]
    resources :treatments, only: [:new, :create]
  end
end

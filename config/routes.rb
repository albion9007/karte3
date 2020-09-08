Rails.application.routes.draw do
  devise_for :users
  get 'patients/index'
  root to: "patients#index"
  resources :users, only: [:edit, :update]
  resources :patients, only: [:new, :create, :index, :show, :edit] do
    resources :observations, only: [:new, :create, :index, :edit, :show]
  end
end

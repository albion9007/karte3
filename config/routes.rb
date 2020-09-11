Rails.application.routes.draw do
  devise_for :users
  get 'patients/index'
  root to: "patients#index"
  resources :users, only: [:edit, :update]
  resources :patients, only: [:new, :create, :index, :show, :edit, :update] do
    resources :observations, only: [:new, :create, :edit, :show, :update]
  end
end

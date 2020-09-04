Rails.application.routes.draw do
  devise_for :users
  get 'patients/index'
  root to: "patients#index"
end

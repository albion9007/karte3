Rails.application.routes.draw do
  devise_for :users
  get 'patients/index'
  root to: "patients#index"
  resources :users, only: [:edit, :update]
  post 'patients/:patient_id/observations/:id/partial_update', to: 'observations#partial_update'
  post 'patients/:patient_id/treatments/:id/treat_partial_update', to: 'treatments#treat_partial_update'
  # エンドポイントを設定する（ajaxで処理したものをobservationsコントローラーのcreate_empty_dataへ渡す）
  put 'patients/:patient_id/observations/create_empty_data', to: 'observations#create_empty_data'
  put 'patients/:patient_id/treatments/create_new_treatment_data', to: 'treatments#create_new_treatment_data'
  delete 'patients/:patient_id/observations/:id/delete', to: 'observations#delete'
  delete 'patients/:patient_id/treatments/:id/delete', to: 'treatments#delete'
  resources :patients do
    resources :observations, only: [:new, :create, :edit, :show, :update]
    resources :treatments, only: [:new, :create, :show]
  end
end

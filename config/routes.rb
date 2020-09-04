Rails.application.routes.draw do
  get 'patients/index'
  root to: "patients#index"
end

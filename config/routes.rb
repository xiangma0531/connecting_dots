Rails.application.routes.draw do
  root to: 'students#index'
  devise_for :students
  resources :dots, only: [:new, :create]
end

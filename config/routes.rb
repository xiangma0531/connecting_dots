Rails.application.routes.draw do
  root to: 'students#index'
  devise_for :students
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

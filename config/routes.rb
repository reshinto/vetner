Rails.application.routes.draw do
  resources :user_profiles
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :vets
  devise_for :users
  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

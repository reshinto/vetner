Rails.application.routes.draw do
  resources :user_profiles
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :vets, controllers: {registrations: "registrations"}
  devise_for :users, controllers: {registrations: "registrations"}
  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :user_profiles
  resources :vet_profiles
end

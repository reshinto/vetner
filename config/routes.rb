Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :vets, controllers: {registrations: "registrations"}
  devise_for :users, controllers: {registrations: "registrations"}
  root 'home#index'
  resources :user_profiles
  resources :vet_profiles
  resources :pets
  resources :pet_records
end

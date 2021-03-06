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
  post '/vet_profiles/:id/add_vet_to_user' => 'vet_profiles#add_vet_to_user', as: 'add_vet_to_user'
  post '/vet_profiles/:id/remove_vet_from_user' => 'vet_profiles#remove_vet_from_user', as: 'remove_vet_from_user'
  get '/contacts', to: 'contacts#new'
  resources :contacts, only: [:new, :create]
  get '/vets/:id' => 'vets#show' , as: 'vet'
  get ':users/edit' => 'devise/registration#edit', :as => :edit_account
end

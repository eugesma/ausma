Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :evaluations
  
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "welcome#index"

  resources :profiles, only: [ :edit, :update ]
  
  resources :assignatures do
    member do
      get :delete
    end
  end

  resources :users_admin, :controller => 'users', only: [:index, :update, :show, :new, :create] do
    member do
      get "change_sector"
      get "edit_permissions" 
      put "update_permissions"
    end
  end
end

Rails.application.routes.draw do
  resources :dedications do
    member do
      get :delete
      get :assign_dedication
    end
  end
  resources :careers
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :evaluations
  
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "welcome#index"
  
  resources :profiles, only: [ :edit, :update ]
  
  resources :assignatures do
    member do
      get :delete
      get :assign_dedication
    end
  end
  
  resources :extension_activities do
    member do
      get :delete
      get :assign_dedication
    end
  end
  
  resources :users_admin, :controller => 'users' do
    member do
      get "change_sector"
      get "edit_permissions" 
      put "update_permissions"
    end
  end
  
  resources :posts

end

Rails.application.routes.draw do
  resources :dedications do
    member do
      get :delete
      get :assign_dedication
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "welcome#index"
  
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  
  devise_for :users
  
  resources :formations do
    member do
      get :delete
      get :assign_dedication
      get :confirm_validation
      patch :validate
    end
  end
  
  resources :meetings do
    member do
      get :delete
      get :assign_dedication
    end
  end
  
  resources :careers

  resources :evaluations
  
  resources :profiles, only: [ :edit, :update ]

  resources :configs, only: [ :show, :edit, :update ]
  
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
  
  resources :projects do
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
  
  resources :posts do
    member do
      patch :validate
    end
  end

  resources :month_presences do
    member do
      get :delete
    end
  end

end

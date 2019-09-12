Rails.application.routes.draw do
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
end

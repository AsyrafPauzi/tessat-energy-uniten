Rails.application.routes.draw do
  devise_for :admins, controllers: {
    sessions: 'admins/sessions'
  }
  devise_scope :admin do
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/application_training', to: 'pages#application_training'
  get '/map_access', to: 'pages#map'
  get '/about_us', to: 'pages#about_us'
  root to: 'pages#home'
  resources :admins, only: [:index]
  namespace :admins do
    namespace :manage do
      resources :maps
      resources :request_maps
    end
    
  end
end

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/application_training', to: 'pages#application_training'
  get '/map', to: 'pages#map'
  get '/about_us', to: 'pages#about_us'
  root to: 'pages#home'

end

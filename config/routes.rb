Rails.application.routes.draw do  
  devise_for :users, :controllers => { registrations: 'registrations'}  
  resources :posts
  get '/login', to: 'devise/sessions#new'
  get '/signup', to: 'registrations#new'
  post '/login', to: 'devise/sessions#create'
  root to: 'posts#index'
end

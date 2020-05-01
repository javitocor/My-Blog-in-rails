Rails.application.routes.draw do
  devise_for :users, path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret',
     confirmation: 'verification', unlock: 'unblock', registration: 'register', sign_up: 'cmon_let_me_in' },
     :controllers => { registrations: 'registrations'} 
  resources :posts
  resources :details, except: [:index, :destroy, :show]
  devise_scope :user do
    get '/login', to: 'devise/sessions#new'
    get '/signup', to: 'registrations#new'
    post '/login', to: 'devise/sessions#create'
  end
  resources :users, only: [:show, :index]
  root to: 'posts#index'
end

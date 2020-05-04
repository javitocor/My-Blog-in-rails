Rails.application.routes.draw do
  get 'tags/index'
  get 'tags/show'
  devise_for :users, path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret',
     confirmation: 'verification', unlock: 'unblock', registration: 'register', sign_up: 'cmon_let_me_in' },
     :controllers => { registrations: 'registrations'} 
  resources :posts do
    resources :comments
  end
  resources :details, except: [:index, :destroy, :show]
  devise_scope :user do
    get '/login', to: 'devise/sessions#new'
    get '/signup', to: 'registrations#new'
    post '/login', to: 'devise/sessions#create'
    authenticated :user do
      root 'posts#index'
    end  
    unauthenticated do
      root 'devise/sessions#new'
    end
  end
  resources :users, only: [:show, :index]
  get '/search', to: 'searches#search'
  resources :tags, only: [:index, :show]
end

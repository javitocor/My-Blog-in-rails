Rails.application.routes.draw do
  root 'posts#index'
  devise_for :users  
  resources :posts
  
end

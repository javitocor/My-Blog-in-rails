Rails.application.routes.draw do  
  devise_for :users, :controllers => { registrations: 'registrations'}  
  resources :posts
  devise_scope :user do
    root to: "devise/sessions#new"
  end
end

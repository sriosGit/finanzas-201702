Rails.application.routes.draw do

  resources :entries
  resources :members
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "pages#login"
end

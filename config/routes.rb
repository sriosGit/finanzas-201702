Rails.application.routes.draw do

  resources :afps
  resources :entries
 
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "members#index"
  authenticate :user do
  	 resources :members
  end
end

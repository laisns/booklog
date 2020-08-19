Rails.application.routes.draw do
  #get 'path' => 'controller#action', as: :url_path
  get 'home/index'
  root 'home#index'
  resources :home, only: [:show]
  get 'search' => 'home#search', as: :search
  post 'get_search_response' => 'home#get_search_response', as: :get_search_response
  get 'register' => 'users#new'
 	post 'users' => 'users#create'
  resources :sessions, only: [:new, :create]
  delete 'logout' => 'sessions#destroy'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

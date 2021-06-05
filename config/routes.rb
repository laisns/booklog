Rails.application.routes.draw do
  #get 'path' => 'controller#action', as: :url_path
  get 'home' => 'home#index'
  root 'home#index'
  get 'search' => 'home#search', as: :search
  get 'search_results' => 'home#search_results', as: :search_results
  post 'get_search_response' => 'home#get_search_response', as: :get_search_response
  resources :users, except: [:destroy] do
    member do
      put :set_avatar
    end
    resources :lists, shallow: true
    resources :user_tags, except: [:edit, :update], shallow: true
  end
  get 'register' => 'users#new'
  get 'edit_profile' => 'users#edit'

  resources :books do
    collection do
      get :search
    end
  end

  resources :book_tags, except: [:edit, :update]
  resources :authors
  resources :book_lists, only: [:new, :create, :destroy]
  resources :user_books, except: [:show]
  get 'user_books/toggle_params' => 'user_books#toggle_params'
  resources :sessions, only: [:new, :create]
  delete 'logout' => 'sessions#destroy'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

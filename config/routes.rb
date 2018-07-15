Rails.application.routes.draw do
  
  devise_for :users
  root 'listings#index'

  resources :listings do
  	collection do
  		get 'search'
  	end
  	resources :reviews, except: [:index,:show]
  end



  get '/about', to: 'pages#about'
  get '/common', to: 'pages#common'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

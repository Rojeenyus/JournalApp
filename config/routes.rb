Rails.application.routes.draw do
  devise_for :users, controllers: {registratons: "registrations"}
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "categories#index"

  resources :categories do
    resources :tasks do
      collection do 
        get 'remove_all'
      end
    end
  end

  # get '/categories' => 'categories#index'

  # get '/categories/:id' => 'categories#show'

  # post '/categories' => 'categories#create'

  # get '/categories/new' => 'categories#new'
end

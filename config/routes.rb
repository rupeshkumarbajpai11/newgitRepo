Rails.application.routes.draw do
  resources :students
  resources :students 
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
   root to: 'students#index'
end

Rails.application.routes.draw do
  resources :students
  # get 'pages/home'
  # root 'pages#home'
  get 'about' => 'pages#about'
  # resources :students
  root 'students#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end

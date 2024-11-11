Rails.application.routes.draw do
  get 'users/index' => "users#index", as: :users_index
  get '/' => "users#new", as: :users_new
  get 'users/:id' => "users#show", as: :users_show
  get 'users/:id/edit' => "users#edit", as: :users_edit

  get 'login' => "users#login_form", as: :login_form

  get 'posts/index' => "posts#index", as: :posts_index
  get 'posts/new' => "posts#new", as: :posts_new
  get 'posts/:id' => "posts#show", as: :posts_show
  get 'posts/:id/edit' => "posts#edit", as: :posts_edit

  post 'login' => "users#login", as: :login
  post 'logout' => "users#logout", as: :logout

  post 'users/create' => "users#create", as: :users_create
  patch 'users/:id/update' => "users#update", as: :users_update
  post 'users/:id/destroy' => "users#destroy", as: :users_destroy

  post 'posts/create' => "posts#create", as: :posts_create
  patch 'posts/:id/update' => "posts#update", as: :posts_update
  post 'posts/:id/destroy' => "posts#destroy", as: :posts_destroy
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end

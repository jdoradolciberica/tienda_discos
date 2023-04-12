Rails.application.routes.draw do
  get "contactanos", to: "home#contactanos"
  get "faq", to: "home#faq"
  get "sobre", to: "home#sobre"
  get 'sesion', to: "sesiones#new"
  post 'sesion', to: "sesiones#create"
  delete 'sesion', to: "sesiones#destroy"
  get 'home/index'
  get 'home', to: "home#index"
  get 'registro', to: "registros#new"
  post 'registro', to: "registros#create"
  root "home#index"
  resources :pedidos
  resources :clientes
  resources :canciones
  resources :discos
  resources :artistas
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end

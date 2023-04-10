Rails.application.routes.draw do
  get 'registros/new'
  get 'registros/create'
  root "discos#index"
  resources :pedidos
  resources :clientes
  resources :canciones
  resources :discos
  resources :artistas
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end

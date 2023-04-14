Rails.application.routes.draw do
  get 'carrito', to: "carritos#show", as: "carrito"
  get 'carrito/agregar/:disco_id', to: "carritos#agregar", as: "carrito_agregar"
  get 'carrito/quitar/:disco_id', to: "carritos#quitar", as: "carrito_quitar"
  get 'carrito/menos/:disco_id', to: "carritos#menos", as: "carrito_menos"
  get 'carrito/mas/:disco_id', to: "carritos#mas", as: "carrito_mas"
  get 'carrito/vaciar', to: "carritos#vaciar", as: "carrito_vaciar"
  get "contactanos", to: "home#contactanos"
  get "faq", to: "home#faq"
  get "sobre", to: "home#sobre"
  get "cliente", to: "clientes#show"
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

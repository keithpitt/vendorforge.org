Vendorage::Application.routes.draw do

  devise_for :users

  root :to => 'pages#index'

  resources :vendors, :only => [ :index, :new, :create, :show ]

end

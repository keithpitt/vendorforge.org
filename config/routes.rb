Vendorage::Application.routes.draw do

  devise_for :users

  root :to => 'pages#index'

  resources :vendors, :only => [ :index, :new, :create, :show ]

  match "users/:id/api_key" => "users#api_key", :defaults => { :format => "json" }

end

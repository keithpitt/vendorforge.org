Vendorforge::Application.routes.draw do

  devise_for :users, :class_name => "VendorForge::User"

  root :to => 'pages#index'

  resources :vendors, :only => [ :index, :new, :create, :show ] do
    get "versions/:version" => "vendors#show", :as => :version, :constraints  => { :version => /[0-z\.]+/ }
    get "versions/:version/download" => "vendors#download", :as => :download, :constraints  => { :version => /[0-z\.]+/ }
  end

  match "users/:id/api_key" => "users#api_key", :defaults => { :format => "json" }

end

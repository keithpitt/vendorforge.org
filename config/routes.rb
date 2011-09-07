VendorkitCom::Application.routes.draw do

  devise_for :users

  root :to => 'pages#index'

end

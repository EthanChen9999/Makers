Rails.application.routes.draw do

  get 'products/get_json/:id' => 'products#get_json'

  get 'members/display' => 'members#display'

  get 'members/index'

  patch 'products/crop/:id' => 'products#crop'
  post 'products/add_image/:id' => 'products#add_image'

  get 'products/index'
  get 'members/about' => 'members#about'
  resources :products
  devise_for :users, :controllers => {:registrations => "registrations"}

  get 'welcome/index'
  root to: 'welcome#index'

end

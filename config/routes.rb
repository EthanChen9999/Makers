Rails.application.routes.draw do

  get 'members/test' => 'members#test'
  get 'members/display' => 'members#display'

  get 'members/index'
  post 'products/add_image/:id' => 'products#add_image'
  delete 'products/destroy_image/:id' => 'products#destroy_image', as: "destroy_image"
  get 'products/index'
  get 'members/about' => 'members#about'
  resources :products
  devise_for :users, :controllers => {:registrations => "registrations"}

  get 'welcome/index'
  root to: 'welcome#index'

end

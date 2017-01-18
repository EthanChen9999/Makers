Rails.application.routes.draw do
  # Devise
  devise_for :users, controllers: {
               sessions: "users/sessions",
               registrations: "users/registrations",
               confirmations: "users/confirmations"
             }
  # Products
  resources :products
  get 'products/index'
  patch 'products/crop/:id' => 'products#crop'
  post 'products/add_image/:id' => 'products#add_image'
  get 'products/get_json/:id' => 'products#get_json'
  # Members
  get 'members/display' => 'members#display'
  get 'members/index'
  get 'members/about' => 'members#about'
  # Welcome
  get 'welcome/index'

  root to: 'welcome#index'

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

end

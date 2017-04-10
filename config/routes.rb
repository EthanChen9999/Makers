Rails.application.routes.draw do
  mount RuCaptcha::Engine => "/rucaptcha"
  # Devise
  devise_for :users, controllers: {
               sessions: "users/sessions",
               registrations: "users/registrations",
               confirmations: "users/confirmations",
             }
  devise_scope :user do
    get "users/edit_pw" => "users/registrations#edit_pw", as: "edit_pw_registrations"
  end

  # Products
  resources :products
  get 'products/index'
  patch 'products/crop/:id' => 'products#crop'
  post 'products/add_image/:id' => 'products#add_image'
  get 'products/get_json/:id' => 'products#get_json'
  # Members
  resources :members
  get 'members/display' => 'members#display'
  get 'members/index'

  # Welcome
  get 'welcome/index'
  get 'welcome/search' => 'welcome#search', as: :search_products
  get '/language/:locale', to: 'welcome#language', as: :change_locale

  root to: 'welcome#index'

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

end

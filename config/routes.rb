Rails.application.routes.draw do
  get 'members/index'

  devise_for :users, :controllers => {:registrations => "registrations"}
  devise_scope :users do
    get "members/update-photo" => "registrations#update_photo"
  end
  get 'welcome/index'
  root to: 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

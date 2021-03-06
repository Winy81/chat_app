Rails.application.routes.draw do

  devise_for :users, :controllers => {:registrations => "registrations"}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root controller: :rooms, action: :index

  get 'rooms/:id', to: 'room_messages#new'

  resources :room_messages
  resources :rooms

  get 'about', to: 'pages#about'
  get 'contact', to: 'pages#contact'

  mount ActionCable.server => '/cable'
  
end

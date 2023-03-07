Rails.application.routes.draw do

  devise_for :users, :controllers => {:registrations => "registrations"}

  root controller: :rooms, action: :index

  get 'rooms/:id', to: 'room_messages#new'

  resources :room_messages
  resources :rooms

  get 'about', to: 'pages#about'
  get 'contact', to: 'pages#contact'

  post   'invite'   => 'accesses#invite'
  delete 'uninvite' => 'accesses#uninvite'

  mount ActionCable.server => '/cable'
  
end

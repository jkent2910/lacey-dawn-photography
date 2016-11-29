Rails.application.routes.draw do
  devise_for :users
  get 'welcome/index'
  get '/family', to: 'welcome#family', as: 'family'
  get '/about', to: 'welcome#about', as: 'about'
  get '/newborns', to: 'welcome#newborns', as: 'newborns'
  get '/children', to: 'welcome#children', as: 'children'
  get '/maternity', to: 'welcome#maternity', as: 'maternity'
  get '/landscapes', to: 'welcome#landscapes', as: 'landscapes'
  get '/city', to: 'welcome#city', as: 'city'
  get '/engagements', to: 'welcome#engagements', as: 'engagements'
  get '/weddings', to: 'welcome#weddings', as: 'weddings'
  get '/seniors', to: 'welcome#seniors', as: 'seniors'
  get '/events', to: 'welcome#events', as: 'events'
  get '/minisessions', to: 'welcome#minisessions', as: 'minisessions'
  get '/testimonials', to: 'welcome#testimonials', as: 'testimonials'
  get '/pricing', to: 'welcome#pricing', as: 'pricing'
  get '/contact_me', to: 'welcome#contact_me', as: 'contact_me'

  post '/welcome/contacts' => 'welcome#contact', as: 'contacts_form'
  get '/dashboard' => 'welcome#dashboard', as: 'dashboard'

  root 'welcome#index'

  resources :clients do
    member do
      get :show_client_photos
      get :favorite_picture
      get :unfavorite_picture
    end
  end

  get '/add_to_cart' => 'items#add_to_cart', as: 'add_to_cart'
  post '/add_items_to_cart' => 'items#add_items_to_cart', as: 'add_items_to_cart'
  get '/view_cart' => 'items#view_cart', as: 'view_cart'
  get '/remove_cart_item' => 'items#remove_cart_item', as: 'remove_cart_item'
  get '/send_cart' => 'items#send_cart', as: 'send_cart'

  resources :items

end

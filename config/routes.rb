Rails.application.routes.draw do
  get 'welcome/index'
  get '/family', to: 'welcome#family', as: 'family'
  get '/about', to: 'welcome#about', as: 'about'

  post '/welcome/contacts' => 'welcome#contact', as: 'contacts_form'

  root 'welcome#index'

end

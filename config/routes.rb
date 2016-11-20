Rails.application.routes.draw do
  get 'welcome/index'
  get '/family', to: 'welcome#family', as: 'family'
  get '/about', to: 'welcome#about', as: 'about'
  get '/newborns', to: 'welcome#newborns', as: 'newborns'
  get '/toddlers', to: 'welcome#toddlers', as: 'toddlers'
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

  root 'welcome#index'

end

Rails.application.routes.draw do
  get 'welcome/index'
  get '/family', to: 'welcome#family', as: 'family'

  root 'welcome#index'

end

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/barns', to: 'barns#index'
  get '/barns/new', to: 'barns#new' 
  get '/horses', to: 'horses#index'
  post '/barns', to: 'barns#create'

  get '/barns/:id', to: 'barns#show'
  get '/horses/:id', to: 'horses#show'
  get '/barns/:id/horses', to: 'barns/horses#index'

  get '/barns/:id/edit', to: 'barns#edit'
  patch '/barns/:id', to: 'barns#update'

  get '/barns/:id/horses/new', to: 'barns/horses#new'
  post '/barns/:id/horses/new', to: 'barns/horses#create'

  get '/horses/:id/edit', to: 'horses#edit'
  patch '/horses/:id/edit', to: 'horses#update'
  delete '/barns/:id', to: 'barns#destroy'
  delete '/horses/:id', to: 'horses#destroy'
  delete 'barns', to: 'barns#destroy'
end

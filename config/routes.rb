Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/barns', to: 'barns#index'
  get '/barns/new', to: 'barns#new' 
  get '/horses', to: 'horses#index'
  post '/barns', to: 'barns#create'
  get '/barns/:id', to: 'barns#show'
  get '/horses/:id', to: 'horses#show'
  get '/barns/:barn_id/horses', to: 'barns/horses#index'
  get '/barns/:barn_id/edit', to: 'barns#edit'
  patch '/barns/:barn_id', to: 'barns#update'
end

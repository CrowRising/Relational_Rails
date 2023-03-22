Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/barns', to: 'barns#index'
  get '/horses', to: 'horses#index'
  get '/barns/:id', to: 'barns#show'
  get 'horses/:id', to: 'horses#show'
  get 'barns/:barn_id/horses', to: 'barns/horses#index'
end

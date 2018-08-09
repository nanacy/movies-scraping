Rails.application.routes.draw do

  get '/',  to: 'movies#home'
  post '/', to: 'movies#create'
  get '/search', to: 'movies#search'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
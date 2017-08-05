Rails.application.routes.draw do

 # get '/artists', to: 'artists#index'
 get '/artists/:id', to:'artists#show', as: 'artist'
 resources :artists
 resources :searches
 root 'static_pages#index'
 get '/auth/spotify/callback', to: 'static_pages#spotify'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

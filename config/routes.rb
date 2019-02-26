Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get '/forecast', to: 'forecasts#show', as: 'forecast'
      get '/backgrounds', to: 'images#show', as: 'image'
      get '/gifs', to: 'gifs#index', as: 'gifs'
      post '/users', to: 'users#create'
      post '/sessions', to: 'sessions#create'
      post '/favorites', to: 'favorites#create'
      get '/favorites', to: 'favorites#index'
    end
  end
end

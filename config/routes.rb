Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get '/forecast', to: 'forecasts#show', as: 'forecast'
      get '/gifs', to: 'gifs#index', as: 'gifs'
    end
  end
end

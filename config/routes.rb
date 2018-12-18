Rails.application.routes.draw do
  resources :calendars, only: [:index, :create, :update]

  get '/calendar/:name/edit', to: 'calendars#edit'
  get '/calendar/:name', to: 'calendars#show'
end

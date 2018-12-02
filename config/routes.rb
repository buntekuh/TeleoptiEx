Rails.application.routes.draw do
  resources :calendars, only: [:index, :show, :create]
end

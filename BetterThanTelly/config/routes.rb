Rails.application.routes.draw do
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'
  resources :event_reviews
  # resources :event_attendees
  post '/event_attendees_path/:id', to: 'event_attendees#create', as: 'attend_event'
  resources :events
  resources :venues
  resources :categories
  resources :reviews
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

    namespace :api do
        namespace :v1 do
          resources :events
          resources :users
          resources :photos 
          resources :journals
          resources :event_spots
          resources :user_events
          resources :user_spots
          resources :spots 
          post '/login', to: 'auth#create'
          get '/profile', to: 'users#profile'
        end
    end
end

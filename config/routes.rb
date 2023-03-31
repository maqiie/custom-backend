Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :tasks, only: [:index, :show, :create, :update, :destroy]
    end
  end

get "/users", to: 'users#index'
get "/tasks", to: 'tasks#index'
get '/tasks/:id', to: 'tasks#show'
post '/tasks', to: 'tasks#create'
put '/tasks/:id', to: 'tasks#update'
delete '/tasks/:id', to: 'tasks#destroy'
get '/users/:id', to: 'users#show'
post '/users', to: 'users#create'
post 'reminders', to: 'reminders#create'
end

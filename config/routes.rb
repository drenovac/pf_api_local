Rails.application.routes.draw do
  devise_for :users,
             path: 'api/v1/',
             controllers: {
               sessions: 'sessions',
               registrations: 'registrations'
             }
  devise_scope :user do
    get 'api/v1/users/current', to: 'sessions#show'
  end
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      # resources :sessions, only: [:create]
      resources :rosters, only: [:index, :show] do
        resources :cnas, only: [:index, :show]
      end
      resources :employees, only: [:index, :show]
      resources :clients do
        resources :employees, only: [:index, :show]
      end
      resources :cnas, only: [:index, :show] do
        resources :rosters, only: [:index, :show]
      end
      get 'user/info' => 'users#info'
    end
  end
end

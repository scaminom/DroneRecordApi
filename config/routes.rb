Rails.application.routes.draw do
  devise_for :users,
             path: 'auth', path_names: {
                             sign_in: 'login',
                             sign_out: 'logout',
                             registration: 'signup'
                           },
             controllers: {
               sessions: 'auth/sessions',
               registrations: 'auth/registrations'
             }

  namespace :api do
    namespace :v1 do
      resources :users, only: :index
      resources :drones, only: %i[index show create update destroy]
      resources :solar_panels, only: :index
      resources :dc_charging_stations, only: :index
      resources :ac_charging_stations, only: %i[index show create update destroy]
      resources :drones_data, only: %i[index show]
    end
  end

  match '*unmatched', to: 'application#no_route_found', via: :all
end

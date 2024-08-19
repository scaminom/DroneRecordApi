Rails.application.routes.draw do
  devise_for :users, path: 'auth', path_names: {
    sign_in:      'login',
    sign_out:     'logout',
    registration: 'signup'
  }, controllers: {
    sessions:      'auth/sessions',
    registrations: 'auth/registrations'
  }

  namespace :api do
    namespace :v1 do
      resources :users, only: :index

      resources :drones, only: %i[index show create update destroy]

      [:solar_panels, :dc_charging_stations, :ac_charging_stations, :drones_data].each do |resource|
        resources resource, only: :index do
          collection do
            get :filter_data
          end
        end
      end

      resources :drones_data, only: %i[index show create]
    end
  end

  match '*unmatched', to: 'application#no_route_found', via: :all
end

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

  resources :users, only: %i[index show create update]
  resources :drones
  resources :stations do
    collection do
      get 'show_station_info'
    end
  end

  resources :solar_panels do
    collection do
      get 'filter_by_week', to: 'solar_panels#index', defaults: { filter_type: :week }
      get 'filter_by_month', to: 'solar_panels#index', defaults: { filter_type: :month }
      get 'filter_by_day', to: 'solar_panels#index', defaults: { filter_type: :day }
      get 'current', to: 'solar_panels#index', defaults: { filter_type: :current }
      get 'show_solar_panel_info'
    end
  end

  match '*unmatched', to: 'application#no_route_found', via: :all
end


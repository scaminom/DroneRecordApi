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

  resources :users, only: :index

  namespace :solar_panel, path: 'solar_panels', as: :solar_panels do
    get '/', to: 'solar_panels#index'
    get 'filter_by_week(/:uav_id)', to: 'week_filtering#index'
    get 'filter_by_month(/:uav_id)', to: 'month_filtering#index'
    get 'filter_by_day(/:uav_id)', to: 'day_filtering#index'
    get 'current(/:uav_id)', to: 'current_filtering#index'
    get 'personalized_info(/:uav_id)', to: 'personalized_filtering#index'
  end

  namespace :drones_data, path: 'drones_data', as: :drones_data do
    get '/', to: 'datos_uavs#index'
    get 'filter_by_week(/:uav_id)', to: 'week_filtering#index'
    get 'filter_by_month(/:uav_id)', to: 'month_filtering#index'
    get 'filter_by_day(/:uav_id)', to: 'day_filtering#index'
    get 'current(/:uav_id)', to: 'current_filtering#index'
    get 'personalized_info(/:uav_id)', to: 'personalized_filtering#index'
  end

  namespace :ac_charging_station, path: 'ac_charging_stations', as: :ac_charging_stations do
    get '/', to: 'ac_charging_stations#index'
    get 'filter_by_week(/:drone_id)', to: 'week_filtering#index'
    get 'filter_by_month(/:drone_id)', to: 'month_filtering#index'
    get 'filter_by_day(/:drone_id)', to: 'day_filtering#index'
    get 'current(/:drone_id)', to: 'current_filtering#index'
    get 'personalized_info(/:drone_id)', to: 'personalized_filtering#index'
  end

  namespace :dc_charging_station, path: 'dc_charging_stations', as: :dc_charging_stations do
    get '/', to: 'dc_charging_stations#index'
    get 'filter_by_week(/:drone_id)', to: 'week_filtering#index'
    get 'filter_by_month(/:drone_id)', to: 'month_filtering#index'
    get 'filter_by_day(/:drone_id)', to: 'day_filtering#index'
    get 'current(/:drone_id)', to: 'current_filtering#index'
    get 'personalized_info(/:drone_id)', to: 'personalized_filtering#index'
  end

  resources :drones

  match '*unmatched', to: 'application#no_route_found', via: :all
end

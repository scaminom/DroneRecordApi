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

  resources :solar_panels, only: [:index] do
    collection do
      get 'filter_by_week(/:uav_id)', to: 'solar_panels#index', defaults: { filter_type: :week }, as: :filter_by_week
      get 'filter_by_month(/:uav_id)', to: 'solar_panels#index', defaults: { filter_type: :month }, as: :filter_by_month
      get 'filter_by_day(/:uav_id)', to: 'solar_panels#index', defaults: { filter_type: :day }, as: :filter_by_day
      get 'current(/:uav_id)', to: 'solar_panels#index', defaults: { filter_type: :current }, as: :current_solar_panels
      get 'personalized_info(/:uav_id)', to: 'solar_panels#index', defaults: { filter_type: :personalized },
                                         as: :personalized_info
    end
  end

  resources :datos_uavs, only: [:index] do
    collection do
      get 'filter_by_week(/:uav_id)', to: 'datos_uavs#index', defaults: { filter_type: :week }, as: :filter_by_week
      get 'filter_by_month(/:uav_id)', to: 'datos_uavs#index', defaults: { filter_type: :month }, as: :filter_by_month
      get 'filter_by_day(/:uav_id)', to: 'datos_uavs#index', defaults: { filter_type: :day }, as: :filter_by_day
      get 'current(/:uav_id)', to: 'datos_uavs#index', defaults: { filter_type: :current }, as: :current_datos_uavs
      get 'personalized_info(/:uav_id)', to: 'datos_uavs#index', defaults: { filter_type: :personalized },
                                         as: :personalized_info
    end
  end

  resources :estacion_carga_dcs, only: [:index] do
    collection do
      get 'filter_by_week(/:uav_id)', to: 'estacion_carga_dcs#index', defaults: { filter_type: :week },
                                      as: :filter_by_week
      get 'filter_by_month(/:uav_id)', to: 'estacion_carga_dcs#index', defaults: { filter_type: :month },
                                       as: :filter_by_month
      get 'filter_by_day(/:uav_id)', to: 'estacion_carga_dcs#index', defaults: { filter_type: :day }, as: :filter_by_day
      get 'current(/:uav_id)', to: 'estacion_carga_dcs#index', defaults: { filter_type: :current },
                               as: :current_estacion_carga_dcs
      get 'personalized_info(/:uav_id)', to: 'estacion_carga_dcs#index', defaults: { filter_type: :personalized },
                                         as: :personalized_info
    end
  end

  resources :estacion_carga_acs, only: [:index] do
    collection do
      get 'filter_by_week(/:uav_id)', to: 'estacion_carga_acs#index', defaults: { filter_type: :week },
                                      as: :filter_by_week
      get 'filter_by_month(/:uav_id)', to: 'estacion_carga_acs#index', defaults: { filter_type: :month },
                                       as: :filter_by_month
      get 'filter_by_day(/:uav_id)', to: 'estacion_carga_acs#index', defaults: { filter_type: :day }, as: :filter_by_day
      get 'current(/:uav_id)', to: 'estacion_carga_acs#index', defaults: { filter_type: :current },
                               as: :current_estacion_carga_acs
      get 'personalized_info(/:uav_id)', to: 'estacion_carga_acs#index', defaults: { filter_type: :personalized },
                                         as: :personalized_info
    end
  end

  resources :uavs

  match '*unmatched', to: 'application#no_route_found', via: :all
end


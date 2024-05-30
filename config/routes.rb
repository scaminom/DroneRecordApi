Rails.application.routes.draw do
  resources :stations
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

  match '*unmatched', to: 'application#no_route_found', via: :all
end

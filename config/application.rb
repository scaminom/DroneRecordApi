require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

module DroneRecordApi
  class Application < Rails::Application
    config.time_zone = 'America/Guayaquil'
    config.load_defaults 7.1
    config.action_dispatch.rescue_responses.merge!('CanCan::AccessDenied' => :unauthorized)
    config.autoload_lib(ignore: ['assets', 'tasks'])
    config.api_only = true
  end
end

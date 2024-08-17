require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

module DroneRecordApi
  class Application < Rails::Application
    config.time_zone = 'America/Guayaquil'
    config.load_defaults 7.1
    I18n.load_path += Dir[File.expand_path('config/locales') + '/*.yml']
    config.i18n.default_locale = :es
    config.autoload_lib(ignore: ['assets', 'tasks'])
    config.api_only = true
  end
end

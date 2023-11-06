require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Peeper
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
    config.i18n.default_locale = :pt
    config.autoload_paths += Dir["#{config.root}/app/controllers/concerns"]
    # application.rb ou application_controller.rb

    config.action_dispatch.default_headers['Access-Control-Allow-Origin'] = 'http://localhost:8080'
    config.action_dispatch.default_headers['Access-Control-Request-Method'] = %w{GET POST PUT DELETE}.join(',')



  end
end

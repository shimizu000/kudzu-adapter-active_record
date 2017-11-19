require_relative 'boot'

require 'action_controller/railtie'
require 'active_record/railtie'

Bundler.require(*Rails.groups)
require "kudzu/adapter/active_record"

module Dummy
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
end
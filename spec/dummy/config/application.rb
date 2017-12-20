require_relative 'boot'

require 'action_controller/railtie'
require 'active_record/railtie'

Bundler.require(*Rails.groups)
require "kudzu/adapter/active_record"

module Dummy
  class Application < Rails::Application
  end
end

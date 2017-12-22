module Kudzu
  module Adapter
    module ActiveRecord
      class Railtie < Rails::Railtie
        config.to_prepare do
          Dir.glob(Rails.root + 'app/decorators/kudzu/**/*_decorator*.rb').each do |c|
            require_dependency(c)
          end
        end
      end
    end
  end
end

ActiveSupport.on_load :active_record do
  require_relative 'all'
end

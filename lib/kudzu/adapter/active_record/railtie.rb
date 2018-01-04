module Kudzu
  module Adapter
    module ActiveRecord
      class Railtie < Rails::Railtie
        ActiveSupport.on_load :active_record do
          require_relative 'all'
        end

        config.after_initialize do
          Dir.glob(Rails.root + 'app/decorators/kudzu/**/*_decorator*.rb').each do |c|
            require_dependency(c)
          end
          Kudzu.logger = Rails.logger
        end
      end
    end
  end
end

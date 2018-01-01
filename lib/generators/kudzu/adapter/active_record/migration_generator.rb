require 'rails/generators'

module Kudzu
  module Adapter
    module ActiveRecord
      class MigrationGenerator < Rails::Generators::Base
        source_root File.join(File.dirname(__FILE__), 'templates')

        def create
          @migration_version = migration_version
          timestamp = Time.now.utc.strftime("%Y%m%d%H%M%S").to_i
          ["create_kudzu_pages", "create_kudzu_chunks", "create_kudzu_links"].each_with_index do |filename, i|
            timestamp += i
            template "#{filename}.rb.erb", "db/migrate/#{timestamp}_#{filename}.rb"
          end
        end

        private

        def migration_version
          if ::ActiveRecord::VERSION::MAJOR >= 5
            "[#{::ActiveRecord::VERSION::MAJOR}.#{::ActiveRecord::VERSION::MINOR}]"
          end
        end
      end
    end
  end
end

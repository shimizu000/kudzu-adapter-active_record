module Kudzu
  module Adapter
    module ActiveRecord
      class Base < ::ActiveRecord::Base
        self.abstract_class = true

        class << self
          def table_name_prefix
            'kudzu_'
          end
        end
      end
    end
  end
end

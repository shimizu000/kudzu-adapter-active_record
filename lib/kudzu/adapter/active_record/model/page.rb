module Kudzu
  module Adapter
    module ActiveRecord
      class Page < Base
        include Kudzu::Model::Page

        has_many :chunks, -> { order(id: :asc) }, dependent: :delete_all

        def response_header
          if response_header_column_is_text?
            JSON.parse(super)
          else
            super
          end
        end

        def response_header=(val)
          if response_header_column_is_text?
            super(JSON.generate(val))
          else
            super
          end
        end

        def data
          chunks.pluck(:data).join
        end

        private

        def response_header_column_is_text?
          type = self.class.columns_hash["response_header"].type
          type == :text || type == :string
        end
      end
    end
  end

  Page = Adapter::ActiveRecord::Page
end

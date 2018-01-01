module Kudzu
  module Adapter
    module ActiveRecord
      class Chunk < Base
        belongs_to :page

        scope :select_without_data, -> { select(column_names - %w(data)) }
      end
    end
  end

  Chunk = Adapter::ActiveRecord::Chunk
end

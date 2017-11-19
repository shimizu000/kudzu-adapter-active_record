module Kudzu
  module Adapter
    module ActiveRecord
      class Content < Base
        belongs_to :page
      end
    end
  end
end

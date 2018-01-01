module Kudzu
  module Adapter
    module ActiveRecord
      class Link < Base
        include Kudzu::Model::Link
      end
    end
  end

  Link = Adapter::ActiveRecord::Link
end

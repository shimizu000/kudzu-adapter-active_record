module Kudzu
  module Adapter
    module ActiveRecord
      class Page < Base
        include Kudzu::Adapter::Base::Page

        has_one :content, dependent: :destroy

        serialize :response_header, JSON
      end
    end
  end
end

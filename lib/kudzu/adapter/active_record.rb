require 'activerecord-import'
require 'kudzu'

if defined? Rails
  require_relative 'active_record/railtie'
else
  require_relative 'active_record/all'
end

module Kudzu
  module Adapter
    module ActiveRecord
      class << self
        @@chunk_size = 5*(1024**2)

        def chunk_size
          @@chunk_size
        end
  
        def chunk_size=(val)
          @@chunk_size = val
        end
      end
    end
  end
end

Kudzu.adapter = Kudzu::Adapter::ActiveRecord

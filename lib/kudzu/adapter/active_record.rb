require 'activerecord-import'
require 'kudzu'

module Kudzu
  module Adapter
    module ActiveRecord
    end
  end
end

Kudzu.adapter = Kudzu::Adapter::ActiveRecord

if defined? Rails
  require_relative 'active_record/railtie'
else
  require_relative 'active_record/all'
end

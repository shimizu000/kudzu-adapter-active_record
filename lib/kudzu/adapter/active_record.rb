require 'activerecord-import'
require 'kudzu'
require 'kudzu/adapter/active_record/all'

Kudzu.adapter = Kudzu::Adapter::ActiveRecord
Kudzu::Page = Kudzu::Adapter::ActiveRecord::Page
Kudzu::Link = Kudzu::Adapter::ActiveRecord::Link

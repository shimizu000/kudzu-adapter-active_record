require 'activerecord-import'
require 'kudzu'
require_relative 'active_record/model/base'
require_relative 'active_record/model/page'
require_relative 'active_record/model/content'
require_relative 'active_record/model/link'
require_relative 'active_record/frontier'
require_relative 'active_record/repository'

Kudzu.adapter = Kudzu::Adapter::ActiveRecord
Kudzu::Page = Kudzu::Adapter::ActiveRecord::Page
Kudzu::Link = Kudzu::Adapter::ActiveRecord::Link
Kudzu::Content = Kudzu::Adapter::ActiveRecord::Content

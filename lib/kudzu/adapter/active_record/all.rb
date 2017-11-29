require_relative 'model/base'
require_relative 'model/page'
require_relative 'model/content'
require_relative 'model/link'
require_relative 'frontier'
require_relative 'repository'

Kudzu::Page = Kudzu::Adapter::ActiveRecord::Page
Kudzu::Link = Kudzu::Adapter::ActiveRecord::Link
Kudzu::Content = Kudzu::Adapter::ActiveRecord::Content

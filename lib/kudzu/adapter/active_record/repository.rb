module Kudzu
  module Adapter
    module ActiveRecord
      class Repository
        def initialize(config)
          @config = config
        end

        def find_by_url(url)
          Page.where(url: url).first_or_initialize
        end

        def register(page)
          if @config.save_content
            content = page.content || page.build_content
            content.data = page.body
          end
          page.save
        end

        def delete(page)
          page.destroy if page
        end
      end
    end
  end
end

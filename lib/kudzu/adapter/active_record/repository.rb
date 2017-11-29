module Kudzu
  module Adapter
    module ActiveRecord
      class Repository
        def initialize(config = {})
          config_keys = [:save_content]
          @config = config.select { |k, _| config_keys.include?(k) }
        end

        def find_by_url(url)
          Page.where(url: url).first_or_initialize
        end

        def register(page)
          if @config[:save_content]
            content = page.content || page.build_content
            content.data = page.body
          end
          page.save
        end

        def delete(page)
          page.destroy if page
        end

        def exist_same_content?(page)
          Page.where.not(url: page.url).where(digest: page.digest).exists?
        end
      end
    end
  end
end

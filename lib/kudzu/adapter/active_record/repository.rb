module Kudzu
  module Adapter
    module ActiveRecord
      class Repository
        def find_by_url(url)
          Page.where(url: url).first_or_initialize
        end

        def register(page)
          if page.body
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

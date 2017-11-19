module Kudzu
  module Adapter
    module ActiveRecord
      class Frontier
        def initialize(uuid, config = {})
          @uuid = uuid
          @monitor = Monitor.new
        end

        def enqueue(urls, depth: 0)
          @monitor.synchronize do
            urls = filter_existing_urls(urls)
            links = urls.map { |url| Link.new(uuid: @uuid, url: url, state: 0, depth: depth) }
            Link.import(links)
            links
          end
        end

        def dequeue(limit: 1)
          @monitor.synchronize do
            links = Link.where(uuid: @uuid, state: 0).order(id: :asc).limit(limit).to_a
            links.each do |link|
              link.state = 1
              link.save
            end
            links
          end
        end

        def clear
          Link.where(uuid: @uuid).delete_all
        end

        private

        def filter_existing_urls(urls)
          urls = Array(urls)
          existed_urls = Link.where(uuid: @uuid, url: urls).pluck(:url)
          urls.select { |url| !existed_urls.include?(url) }
        end
      end
    end
  end
end

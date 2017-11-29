module Kudzu
  module Adapter
    module ActiveRecord
      class Frontier
        def initialize(uuid, config = {})
          @uuid = uuid
          @monitor = Monitor.new
        end

        def enqueue(anchors, depth: 0)
          @monitor.synchronize do
            anchors = filter_existing_urls(anchors)
            links = anchors.map { |anchor| Link.new(uuid: @uuid,
                                                    url: anchor[:url],
                                                    title: anchor[:title],
                                                    state: 0,
                                                    depth: depth) }
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

        def filter_existing_urls(anchors)
          urls = Array(anchors).map { |anchor| anchor[:url] }
          existed_urls = Link.where(uuid: @uuid, url: urls).pluck(:url)
          anchors.select { |anchor| !existed_urls.include?(anchor[:url]) }
        end
      end
    end
  end
end

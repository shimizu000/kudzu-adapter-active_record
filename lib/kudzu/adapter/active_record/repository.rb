module Kudzu
  module Adapter
    module ActiveRecord
      class Repository
        def find_by_url(url)
          case url
          when /\Ahttp:\/\/.*/
            another_url = url.sub('http', 'https')
          else
            another_url = url.sub('https', 'http')
          end
          Page.find_by('url in (?, ?)', url, another_url) || Page.new(url: url)
        end

        def register(page)
          ActiveRecord::Base.transaction do
            page.save
            save_chunks(page) if page.body
          end
        end

        def delete(page)
          page.destroy if page
        end

        private

        def save_chunks(page)
          chunk_num = 0
          each_chunk(page.body, ActiveRecord.chunk_size) do |chunked, i|
            chunk = page.chunks.select_without_data.offset(i).limit(1).first_or_initialize
            chunk.data = chunked
            chunk.save
            chunk_num = i + 1
          end

          if page.chunks.count - chunk_num > 0
            page.chunks.select_without_data.offset(chunk_num).each(&:delete)
          end
        end

        def each_chunk(body, size)
          pos = 0
          i = 0
          while (chunked = body.byteslice(pos, size))
            yield chunked, i
            pos += size
            i += 1
          end
        end
      end
    end
  end
end

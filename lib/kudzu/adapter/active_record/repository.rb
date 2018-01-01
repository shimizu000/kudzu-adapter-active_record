module Kudzu
  module Adapter
    module ActiveRecord
      class Repository
        def find_by_url(url)
          Page.find_or_initialize_by(url: url)
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

          if (offset = chunk_num - page.chunks.count) > 0
            page.chunks.offset(offset).delete_all
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

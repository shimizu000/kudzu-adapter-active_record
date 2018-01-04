describe Kudzu::Crawler do
  let(:seed_url) { "http://localhost:9292/test/index.html" }
  before do
    Kudzu.logger = Logger.new(STDOUT)
    Kudzu.logger.level = :debug
  end

  it 'has a version number' do
    expect(Kudzu::Adapter::ActiveRecord::VERSION).not_to be_nil
  end

  context 'run' do
    it 'runs crawling' do
      Kudzu::Adapter::ActiveRecord.chunk_size = 1.kilobytes
      Kudzu::Crawler.new(politeness_delay: 0).run(seed_url)

      page = Kudzu::Page.first
      expect(page).not_to be(nil)
      expect(page.response_header).not_to be(nil)
      expect(page.data).not_to be(nil)

      Kudzu::Adapter::ActiveRecord.chunk_size = 1.megabytes
      Kudzu::Crawler.new(politeness_delay: 0).run(seed_url)
    end
  end
end

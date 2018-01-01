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
      Kudzu::Crawler.new(politeness_delay: 0).run(seed_url)
      expect(Kudzu::Page.count > 0).to be_truthy
    end
  end
end

describe Kudzu::Crawler do
  before do
    @seed_url = "http://localhost:9292/test/index.html"
  end

  it 'has a version number' do
    expect(Kudzu::Adapter::ActiveRecord::VERSION).not_to be_nil
  end

  context 'run' do
    it 'runs crawling' do
      Kudzu::Crawler.new.run(@seed_url)
      expect(Kudzu::Page.count > 0).to be_truthy
    end
  end
end

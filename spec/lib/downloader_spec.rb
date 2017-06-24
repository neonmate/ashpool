describe Downloader do
  let(:url) { 'http://example.com' }
  subject(:downloader) { described_class.new(url) }

  describe 'run' do
    let(:expected_file) { '19900101000000000000000_example_com_.zip' }

    it 'creates file' do
      expect(expected_file).not_to be_an_existing_file
      downloader.run
      expect(expected_file).to be_an_existing_file
    end
  end
end
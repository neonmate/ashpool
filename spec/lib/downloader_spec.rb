describe Ashpool::Downloader, :type => :aruba do
  let(:url) { 'http://example.com' }
  let(:expected_file) { '19900101000000000000000_example_com_.zip' }
  subject(:downloader) { described_class.new(url, 'tmp/aruba') }

  it 'cleans up file after run' do
    expect(expected_file).not_to be_an_existing_file
  end

  describe 'run' do
    before { downloader.run }

    it 'creates file' do
      expect(expected_file).to be_an_existing_file
    end

    context 'when extracted' do
      let(:index) { '19900101000000000000000/example.com/index.html' }
      let(:expected_index) { read('../../spec/fixtures/index.html') }

      before { run("unzip #{expected_file}") }

      it 'saves http site in archive' do
        expect(index).to be_an_existing_file
        expect(read(index)).to eq(expected_index)
      end
    end
  end
end
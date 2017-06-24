describe Ashpool::Uploader do
  let(:access_key_id) { '1234' }
  let(:secret_access_key) { 'ABCD' }
  let(:region) { 'us-west-2' }
  let(:bucket) { 'test' }
  let(:file_path) { 'spec/fixtures/test.zip' }
  let(:client) { uploader.send(:client) }

  subject(:uploader) { described_class.new(access_key_id, secret_access_key, region, bucket, file_path) }

  around(:each) do |example|
    WebMock.disable_net_connect!
    example.run
    WebMock.allow_net_connect!
  end

  before do
    allow(uploader).to receive(:stub_responses).and_return(true)
  end

  it 'uploads file to s3' do
    expect(uploader.run).to eq(true)
  end
end

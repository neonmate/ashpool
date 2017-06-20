describe HtmlCopier, type: :request do
  describe '/copy' do
    let(:path) { '/copy' }
    let(:params) {
      url: 'http://example.com',
      access_key_id: '1234',
      secret_access_key: 'ABCD'
    }

    before { get(path, params) }

    it do
      except
    end
  end
end

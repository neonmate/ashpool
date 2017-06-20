require 'grape'

require_relative '../lib/downloader'
require_relative '../lib/uploader'

class HtmlCopier < Grape::API
  SUPPORTED_REGIONS = %w(us-east-1 us-west-2 eu-west-1 ap-northeast-1 ap-southeast-1 ap-southeast-2)

  version 'v1', using: :path
  format :json

  params do
    requires :url, type: String
    requires :access_key_id, type: String
    requires :secret_access_key, type: String
    optional :region, type: String, default: 'us-west-2', values: SUPPORTED_REGIONS
  end

  post :copy do
    dump = Downloader.new.download(params[:url])
    Uploader.new(params[:access_key_id], params[:secret_access_key]).upload(dump)
    'done'
  end
end

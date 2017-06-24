require 'grape'

require_relative '../lib/ashpool'

class Api < Grape::API
  SUPPORTED_REGIONS = %w(us-east-1 us-west-2 eu-west-1 ap-northeast-1 ap-southeast-1 ap-southeast-2)

  version 'v1', using: :path
  format :json

  rescue_from :all do |e|
    error!({status: 500, title: 'Internal Server Error'}.to_json, 500)
  end

  params do
    requires :url, type: String
    requires :access_key_id, type: String
    requires :secret_access_key, type: String
    requires :bucket, type: String
    optional :region, type: String, values: SUPPORTED_REGIONS
  end

  post :dump do
    file_path = Ashpool::Downloader.new(params[:url]).run
    Ashpool::Uploader.new(params[:access_key_id], params[:secret_access_key], params[:region], params[:bucket], file_path).run
    {status: 200, title: 'Success'}.to_json
  end
end

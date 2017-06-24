require 'aws-sdk'

module Ashpool
  class Uploader
    def initialize(access_key_id, secret_access_key, region, bucket, file_path)
      @credentials = Aws::Credentials.new(access_key_id, secret_access_key)
      @region = region
      @bucket = bucket
      @file_path = file_path
    end

    def run
      upload
    end

    private

    def upload
      obj = s3.bucket(@bucket).object(file_basename)
      obj.upload_file(@file_path) || raise(Error)
    end

    def file_basename
      File.basename(@file_path)
    end

    def s3
      @s3 ||= Aws::S3::Resource.new(client: client)
    end

    def client
      @client ||= Aws::S3::Client.new(
        region: @region,
        credentials: @credentials,
        stub_responses: stub_responses
      )
    end

    def stub_responses
      false
    end
  end
end

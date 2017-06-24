require 'aws-sdk'

class Uploader
  def initialize(access_key_id, secret_access_key, file_path)
    @aws_credentials = Aws::Credentials.new(access_key_id, secret_access_key)
    @file_path = file_path
  end

  def run
  end
end

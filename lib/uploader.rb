require 'aws-sdk'

class Uploader
  def initialize(access_key_id, secret_access_key)
    @aws_credentials = Aws::Credentials.new(access_key_id, secret_access_key)
  end

  def upload(dump)
  end
end

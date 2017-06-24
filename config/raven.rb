require 'raven'

Raven.configure do |config|
  config.processors -= [Raven::Processor::PostData]
  config.sanitize_fields = ['access_key_id', 'secret_access_key', 'bucket']
end

require 'open3'

class Downloader
  USER_AGENT = 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36'
  MAX_PATH_LENGTH = 1024
  WORKING_DIR = 'tmp'

  def initialize(url)
    @url = url
    @timestamp = current_timestamp
    @uri = URI.parse(url)
  end

  def run
    download
    compress
  end

  private

  def current_timestamp
    Time.now.strftime('%Y%m%d%H%M%S%N')
  end

  def download
    Open3.capture3(
      'wget',
      '--page-requisites',
      '--convert-links',
      '--span-hosts',
      "--user-agent=#{USER_AGENT}",
      "--directory-prefix=#{uncompressed_path}",
      *ignore_robots,
      @uri.to_s,
      chdir: WORKING_DIR
    )
  end

  def compress
    Open3.capture3(
      'zip',
      '-r',
      '-m',
      compressed_path,
      uncompressed_path,
      chdir: WORKING_DIR
    )

    compressed_path
  end

  def uncompressed_path
    @timestamp
  end

  def ignore_robots
    ['--execute', 'robots=off']
  end

  def compressed_path
    unsafe_path = [@timestamp, @uri.host, @uri.path].join('_')
    sanitized_path = sanitize(unsafe_path)
    [sanitized_path, '.zip'].join
  end

  def sanitize(unsafe_path)
    unsafe_path.gsub(/[^0-9a-zA-Z]/i, '_')[0..MAX_PATH_LENGTH]
  end
end

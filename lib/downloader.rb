require 'open3'

class Downloader
  USER_AGENT = 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36'

  def download(url)
    _stdout_str, _error_str, _status = Open3.capture3(
      'wget',
      '--page-requisites',
      '--convert-links',
      # '--execute robots=off',
      '--span-hosts',
      "--user-agent=#{USER_AGENT}",
      "--directory-prefix=#{current_timestamp}",
      url,
      chdir: 'tmp'
    )
  end


  private

  def current_timestamp
    Time.now.strftime('%Y%m%d%H%M%S%N')
  end
end

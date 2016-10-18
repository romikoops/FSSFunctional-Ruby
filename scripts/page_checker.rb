require 'capybara'
require 'capybara/dsl'
require_relative '../config/boot'
require_relative '../config/capybara'

class PageChecker
  include Capybara::DSL

  RESULT_FILE = "page_checker_result_#{Time.now.utc.strftime('%Y-%m-%d_%H-%M-%S')}.csv".freeze
  SITE_MAP_URL = "#{Howitzer.app_protocol}://#{Howitzer.app_host}/sitemap".freeze

  def self.perform
    new.check_links
  end

  def check_links
    write_result('Status', 'URL')
    puts 'Checking site map links'
    links.map(&method(:check_link))
  end

  private

  def check_link(link)
    RestClient::Resource.new(link, verify_ssl: false).get
    puts "#{'OK'.ljust(50)}: #{link}"
  rescue => e
    write_result e.message.gsub(/[^\w]+/, ' '), link
    puts "#{e.message.gsub(/[^\w]+/, ' ').ljust(50)}: #{link}"
  end

  def open_page(url)
    puts "Open page #{url}"
    retryable(tries: 10, sleep: 3, silent: true, on: ::Net::ReadTimeout) do
      visit url
    end
    first('.emailmodalblocker a.closebutton').try :click
  end

  def page_links
    puts 'Getting page links'
    all('.sitemap-menu-box .submenulink a:not([href*="/sitemap/"])').map { |l| l[:href] }.uniq.compact
  rescue => e
    puts e.message
    []
  end

  def site_map_links
    puts 'Getting site map links'
    all('.sitemap-menu-box .submenulink a[href*="/sitemap/"]').map { |l| l[:href] }.uniq.compact
  rescue => e
    puts e.message
    []
  end

  def links(page_url = SITE_MAP_URL)
    open_page page_url
    page_links + site_map_links.inject([]) { |a, e| a + links(e) }
  end

  def write_result(status, link)
    File.open(RESULT_FILE, 'a') { |f| f.puts "#{status},#{link}" }
  end
end

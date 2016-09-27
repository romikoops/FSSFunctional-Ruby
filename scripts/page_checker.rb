require 'capybara'
require 'capybara/dsl'
require_relative '../boot'

class PageChecker
  include Capybara::DSL

  RESULT_FILE = "page_checker_result_#{Time.now.utc.strftime('%Y-%m-%d_%H-%M-%S')}.csv".freeze
  SITE_MAP_URL = "#{settings.app_protocol}://#{settings.app_host}/sitemap".freeze

  def initialize
    write_result('Status', 'URL')
    open_main_site_map_page
  end

  def open_main_site_map_page
    puts "Open page #{SITE_MAP_URL}"
    visit SITE_MAP_URL
    puts 'Closing email modal blocker dialog'
    find('.emailmodalblocker a.closebutton').try :click
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

  def links(page_url=SITE_MAP_URL)
    puts "Open page #{page_url}"
    visit page_url
    page_links + site_map_links.inject([]) { |r, u| r + links(u) }
  end

  def check_links
    puts 'Checking site map links'
    links.map do |link|
      begin
        RestClient.get(link)
        puts "#{'OK'.ljust(50)}: #{link}"
      rescue => e
        write_result e.message.gsub(/[^\w]+/, ' '), link
      end
    end
  end

  def write_result(status, link)
    puts "#{status.ljust(50)}: #{link}"
    File.open(RESULT_FILE, 'a') { |f| f.puts "#{status},#{link}" }
  end
end
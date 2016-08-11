Dir.chdir(File.join(File.dirname(__FILE__), '.'))

def settings
  SexySettings::Base.instance
end

require 'rest_client'
require 'howitzer/version'
require 'howitzer/settings'
require_relative 'patches/capybara-settings-patch'
require 'howitzer/utils'
require 'howitzer/helpers'
require 'howitzer/email'
require 'howitzer/web_page'
require 'howitzer/blank_page'


require File.join(File.dirname(__FILE__), 'api', 'search_api')

Dir[File.join(File.dirname(__FILE__), './sections/**/*.rb')].each { |f| require f }
require File.join(File.dirname(__FILE__), 'pages', 'search', 'base_page')
Dir[File.join(File.dirname(__FILE__), './pages/**/*.rb')].each { |f| require f }

require File.join(File.dirname(__FILE__), 'prerequisites/her')
Dir[File.join(File.dirname(__FILE__), './prerequisites/models/**/*.rb')].each { |f| require f }
require File.join(File.dirname(__FILE__), 'prerequisites/factory_girl')

def api
  SearchApi::CigarSearch
end
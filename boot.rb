Dir.chdir(File.join(File.dirname(__FILE__), '.'))

def settings
  SexySettings::Base.instance
end

require 'rest_client'
require 'howitzer'



Dir[File.join(File.dirname(__FILE__), './helpers/**/*.rb')].each { |f| require f }

def api_filters_collection
  APIFiltersCollection.instance
end

require File.join(File.dirname(__FILE__), 'api', 'search_api')
Dir[File.join(File.dirname(__FILE__), './api/**/*.rb')].each { |f| require f }

Dir[File.join(File.dirname(__FILE__), './sections/**/*.rb')].each { |f| require f }
require File.join(File.dirname(__FILE__), 'pages', 'search', 'base_page')
Dir[File.join(File.dirname(__FILE__), './pages/**/*.rb')].each { |f| require f }

require File.join(File.dirname(__FILE__), 'prerequisites/her')
Dir[File.join(File.dirname(__FILE__), './prerequisites/models/**/*.rb')].each { |f| require f }
require File.join(File.dirname(__FILE__), 'prerequisites/factory_girl')

# $LOAD_PATH << File.join(root_path, 'search_api')
# $LOAD_PATH << File.join(root_path, 'sections')
# $LOAD_PATH << File.join(root_path, 'pages')
require_relative '../scripts/page_checker'

task :check_site_map_links do
  PageChecker.new.check_links
end
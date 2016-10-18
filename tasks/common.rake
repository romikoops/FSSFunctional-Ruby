require_relative '../scripts/page_checker'
desc 'Check all sitemap links'
task :check_site_map_links do
  PageChecker.perform
end

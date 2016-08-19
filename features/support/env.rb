require 'cucumber'
require 'capybara/cucumber'
require 'faker'
require_relative '../../boot'

World(Capybara::Settings)
World(SearchApi::Helpers)
World(FactoryGirl::Syntax::Methods)
RestClient.log = $stdout

log.settings_as_formatted_text
DataStorage.store('sauce', :start_time, Time.now.utc)
DataStorage.store('sauce', :status, true)

Before do |scenario|
  page.driver.browser.manage.window.resize_to(1280, 1024)
  log.print_feature_name(scenario.feature.name)
  log.print_scenario_name(scenario.name)
  @session_start = duration(Time.now.utc - DataStorage.extract('sauce', :start_time))
end

After do |scenario|
  if sauce_driver?
    DataStorage.store('sauce', :status, false) if scenario.failed?
    session_end = duration(Time.now.utc - DataStorage.extract('sauce', :start_time))
    log.info "SAUCE VIDEO #{@session_start} - #{session_end} URL: #{sauce_resource_path('video.flv')}"
  elsif ie_browser?
    log.info 'IE reset session'
    page.execute_script("void(document.execCommand('ClearAuthenticationCache', false));")
  end
  page.execute_script('logout();') rescue nil
  DataStorage.clear_all_ns
end

at_exit do
  if sauce_driver?
    log.info "SAUCE SERVER LOG URL: #{Capybara::Settings.sauce_resource_path('selenium-server.log')}"
    Capybara::Settings.update_sauce_job_status(passed: DataStorage.extract('sauce', :status))
  end
end
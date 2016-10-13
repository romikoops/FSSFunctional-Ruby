require 'cucumber'
require 'capybara-screenshot/cucumber'
require_relative '../../config/boot'
require_relative '../../config/capybara'

World(FactoryGirl::Syntax::Methods)

FileUtils.mkdir_p(Howitzer.log_dir)

Howitzer::Log.settings_as_formatted_text
Howitzer::Cache.store(:cloud, :start_time, Time.now.utc)
Howitzer::Cache.store(:cloud, :status, true)

Before do |scenario|
  Capybara.use_default_driver
  Howitzer::Log.print_feature_name(scenario.feature.name)
  Howitzer::Log.print_scenario_name(scenario.name)
  @session_start = CapybaraHelpers.duration(Time.now.utc - Howitzer::Cache.extract(:cloud, :start_time))
end

After do |scenario|
  if CapybaraHelpers.cloud_driver?
    Howitzer::Cache.store(:cloud, :status, false) if scenario.failed?
    session_end = CapybaraHelpers.duration(Time.now.utc - Howitzer::Cache.extract(:cloud, :start_time))
    Howitzer::Log.info "CLOUD VIDEO #{@session_start} - #{session_end}" \
             " URL: #{CapybaraHelpers.cloud_resource_path(:video)}"
  elsif CapybaraHelpers.ie_browser?
    Howitzer::Log.info 'IE reset session'
    page.execute_script("void(document.execCommand('ClearAuthenticationCache', false));")
  end
  begin
    Capybara.current_session.execute_script('logout();')
  rescue
    nil
  end
  Howitzer::Cache.clear_all_ns
  Capybara.reset_sessions!
end

at_exit do
  if CapybaraHelpers.cloud_driver?
    Howitzer::Log.info "CLOUD SERVER LOG URL: #{CapybaraHelpers.cloud_resource_path(:server_log)}"
    CapybaraHelpers.update_cloud_job_status(passed: Howitzer::Cache.extract(:cloud, :status))
  end
end

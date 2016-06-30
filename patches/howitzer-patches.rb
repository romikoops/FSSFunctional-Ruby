class WebPage
  ABSTRACT_PAGE_NAMES = [BasePage]

  Howitzer::Utils::PageValidator.pages.delete_if {|p| ABSTRACT_PAGE_NAMES.include? p }

  def initialize
    check_validations_are_defined! unless ABSTRACT_PAGE_NAMES.include?(self.class)
    page.driver.browser.manage.window.maximize if settings.maximized_window
  end
end

module Capybara
  module Settings
    module_function
    def define_browserstack_driver
      caps_opts = {
        name: "#{prefix_name} #{settings.bs_mobile ? settings.bs_m_browser : settings.bs_browser_name.upcase}",
        maxduration: settings.bs_max_duration.to_i,
        idletimeout: settings.bs_idle_timeout.to_i,
        project: settings.bs_project,
        build: settings.bs_build,
        resolution: settings.bs_resolution,
        acceptSslCerts: settings.bs_accept_ssl_certs
      }

      if settings.bs_local
        caps_opts['browserstack.local'] = settings.bs_local
        caps_opts['browserstack.localIdentifier'] = settings.bs_local_ID
      end

      if settings.bs_mobile
        caps_opts[:browserName] = settings.bs_m_browser
        caps_opts[:platform] = settings.bs_m_platform
        caps_opts[:device] = settings.bs_m_device
      else
        caps_opts[:os] = settings.bs_os_name
        caps_opts[:os_version] = settings.bs_os_version
        caps_opts[:browser] = settings.bs_browser_name
        caps_opts[:browser_version] = settings.bs_browser_version
      end

      options = {
        url: settings.bs_url,
        desired_capabilities: ::Selenium::WebDriver::Remote::Capabilities.new(caps_opts),
        browser: :remote
      }
      Capybara.register_driver :browserstack do |app|
        driver = Capybara::Selenium::Driver.new(app, options)
        driver.browser.file_detector = lambda do |args|
          str = args.first.to_s
          str if File.exist?(str)
        end

        driver
      end
    end

    define_driver
  end
end
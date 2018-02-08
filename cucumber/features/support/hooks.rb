require_relative 'helper.rb'
require_relative 'spec_helper.rb'

World(Bazar::Pages)

World(Helper)

Before do |feature|
  Capybara.configure do |config|
    config.default_driver = :selenium
    config.app_host = CONFIG['url']
  end

  Capybara.default_max_wait_time = 60
  unless BROWSER.eql?('chrome')
    Capybara.current_session.driver.browser.manage.window.maximize
  end

end

After do |scenario|
  scenario_name = scenario.name.gsub(/\s+/, '_').tr('/', '_')
  if scenario.failed?
    take_screenshot(scenario_name.downcase!, 'failed')
  else
    take_screenshot(scenario_name.downcase!, 'passed')
  end

  unless BROWSER.eql?('chrome')
    Capybara.current_session.driver.quit
  end
end
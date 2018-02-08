require 'capybara'
require 'capybara/cucumber'
require 'selenium-webdriver'
require 'site_prism'
require 'rspec'
require 'yaml'
require 'capybara/poltergeist'
require 'faker'

BROWSER = ENV['BROWSER']
ENVIRONMENT_TYPE = ENV['ENVIRONMENT_TYPE']

CONFIG = YAML.load_file(File.dirname(__FILE__) + "/config/#{ENVIRONMENT_TYPE}.yaml")

Capybara.register_driver :selenium do |app|
    if BROWSER.eql?('chrome')
      Capybara::Selenium::Driver.new(app,
      :browser => :chrome,
      :desired_capabilities => Selenium::WebDriver::Remote::Capabilities.chrome(
        'chromeOptions' => {
          'args' => [ "--window-size=1600,1024" ]
        }
      )
    )

    elsif BROWSER.eql?('firefox')
      Capybara::Selenium::Driver.new(app, :browser => :firefox, :marionette => true)
    elsif BROWSER.eql?('internet_explorer')
      Capybara::Selenium::Driver.new(app, :browser => :internet_explorer)
    elsif BROWSER.eql?('safari')
      Capybara::Selenium::Driver.new(app, :browser => :safari)
    elsif BROWSER.eql?('poltergeist')
      options = { js_errors: false }
      Capybara::Poltergeist::Driver.new(app, options)
    end
  end
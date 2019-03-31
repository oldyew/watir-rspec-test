require 'rspec'
require 'allure-rspec'
require 'pathname'
require 'watir'
require 'webdriver_manager'

RSpec.configure do |config|
  config.include AllureRSpec::Adaptor

  config.before :all do
    @browser = Watir::Browser.new :chrome
    @browser.driver.manage.timeouts.implicit_wait = 10
    @browser.window.maximize
    @browser.goto ''
    sleep(5)
  end

  config.after :all do
    @browser.quit if @browser
  end
end

AllureRSpec.configure do |c|
  c.logging_level = false
end

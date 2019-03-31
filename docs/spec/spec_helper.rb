
# Configuration for watir-rspec
require 'watir/rspec'
require 'allure-rspec'
require 'webdrivers'
# require 'webdriver_manager'
require 'watir_drops'
require 'watir_model'
require 'config_model'
require 'require_all'
require 'ui2api'
require 'watigiri'

require_rel 'support'

log = Logger.new(STDOUT)
log.level = :info
RestClient.log = log

include YoungGuns

RSpec.configure do |config|
  config.include AllureRSpec::Adaptor
  # Use Watir::RSpec::HtmlFormatter to get links to the screenshots, html and
  # all other files created during the failing examples.

  # config.add_formatter(:progress) if config.formatters.empty?
  # config.add_formatter(Watir::RSpec::HtmlFormatter)
  @config = Model::Config.new
  Site.base_url = @config.base_url
  UI2API::Base.base_url = Site.base_url
  
  # Open up the browser for each example.

  # config.before :all do
  config.before(:context) do
    @config = Model::Config.new
    @browser = Watir::Browser.new :chrome
    WatirDrops::PageObject.browser = @browser
    Site.browser = @browser
    @site = Site.new
    @browser.driver.manage.timeouts.implicit_wait = 10
    @browser.window.maximize
  end

  # Close that browser after each example.

  # config.after :all do
  config.after(:context) do
    # browser.driver().delete_all_cookies()
    @browser.close if @browser
  end

  # Include RSpec::Helper into each of your example group for making it possible to
  # write in your examples instead of:
  #   @browser.goto "localhost"
  #   @browser.text_field(name: "first_name").set "Bob"
  #
  # like this:
  #   goto "localhost"
  #   text_field(name: "first_name").set "Bob"
  #
  # This needs that you've used @browser as an instance variable name in
  # before :all block.
  config.include Watir::RSpec::Helper

  # Include RSpec::Matchers into each of your example group for making it possible to
  # use #within with some of RSpec matchers for easier asynchronous testing:
  #   expect(@browser.text_field(name: "first_name")).to exist.within(2)
  #   expect(@browser.text_field(name: "first_name")).to be_present.within(2)
  #   expect(@browser.text_field(name: "first_name")).to be_visible.within(2)
  #
  # You can also use #during to test if something stays the same during the specified period:
  #   expect(@browser.text_field(name: "first_name")).to exist.during(2)
  config.include Watir::RSpec::Matchers

  AllureRSpec.configure do |c|
    c.logging_level = false
    c.clean_dir = false
  end
end

require 'watir/rspec'
require 'watir'

RSpec.configure do |config|
  config.add_formatter(:progress) if config.formatters.empty?
  config.add_formatter(Watir::RSpec::HtmlFormatter)

  config.before :all, type: :request do
    @browser = Watir::Browser.new
  end

  config.after :all, type: :request do
    @browser.close if @browser
  end
  config.include Watir::RSpec::Helper, type: :request
  config.include Watir::RSpec::Matchers, type: :request
end

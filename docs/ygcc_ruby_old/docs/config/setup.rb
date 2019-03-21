
require 'rspec/expectations'
require '../../../mvc/controller/wd/app'


RSpec.configure do |config|
  config.before(:all) do
    @app = Application.new
  end

  config.after(:all) do
    @app.quit
  end

end

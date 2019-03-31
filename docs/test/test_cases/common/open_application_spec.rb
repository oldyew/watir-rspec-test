
require '../config/setup'
require 'rspec'

describe 'User' do
  it 'should open application' do
    @app.open_application
    @app.resize_browser_window
  end
end


require '../config/setup'
require 'rspec'

describe 'User' do

  it 'should login' do
    @app.open_application
    @app.resize_browser_window
    @app.login
  end
end
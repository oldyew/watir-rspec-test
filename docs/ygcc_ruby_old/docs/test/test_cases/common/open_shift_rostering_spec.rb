
require '../config/setup'
require 'rspec'

describe 'User' do
  it 'should open shift rostering' do
    @app.open_application
    @app.resize_browser_window
    @app.login
    @app.open_shift_rostering
  end
end

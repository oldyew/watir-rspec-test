
require '../config/setup'
require 'rspec'


describe 'User' do
  it 'should open customer list' do
    @app.open_application
    @app.resize_browser_window
    @app.login
    @app.open_customer_list
  end
end

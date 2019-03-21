require 'spec_helper'
require './lib/controller/wd/user management/user_management'
require './lib/model/user_management_model'

describe 'User' do
  it 'to logins to application' do
    login_page = div(class: 'ygcc-button__label')
    expect(login_page.text).to eq('Log in')
    submit_login_data($login_data)
    # result = div(class: 'title').text
    # expect(result).to eq('Shift Roster')
  end

  # it 'to change password' do
  #   open_user_profile
  #   open_password
  #   submit_password_setting($password_setting)
  # end
end


require './spec/spec_helper'
require './lib/data/user_data'

@user_data.each do |user_data|
describe 'User' do
  it 'to login to application' do |e|
    e.step 'opens application home page' do
      @app.open
      @app.login_page_loaded?
    end
    e.step 'submits login data and appears on Shift Roster page' do
      @app.submit_login_data user_data
      @app.shift_rostering_loaded?
    end
  end

  xit 'to change password' do |e|
    e.step 'opens user profile' do
      open_user_profile
    end
    e.step 'opens password section' do
      open_password
    end
    e.step 'changes password' do
      submit_password_setting($password_setting)
    end
  end

  xit 'to reset password' do |e|
    e.step 'opens application home page' do
      null
    end
    e.step 'proceeds to reset password page' do
      null
    end
    e.step 'submits email data' do
      null
    end
    e.step 'proceeds to terminate password submit' do
      null
    end
    e.step 'submits terminate password' do
      null
    end
    e.step 'description' do
      null
    end
  end
end
end

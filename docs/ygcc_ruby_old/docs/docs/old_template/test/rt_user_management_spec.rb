require './spec/spec_helper'
require './lib/data/user_data'

@user_data.each do |user_data|
  describe 'User',
    feature: 'User Management',
    severity: :normal do
    before(:step) do |s|
      puts "Before step #{s.current_step}"
    end
    xit 'to login to application', 
      story: 'Test',
      severity: :normal,
      testId: 'https://jira.quartileone.com/browse/YGCC-2290',
      issue: 'https://jira.quartileone.com/browse/YGCC-1290' do |e|
      e.step 'opens application home page' do
        @app.open
        @app.login_page_loaded?
      end
      e.step 'submits login data and appears on Shift Roster page' do
        @app.submit_login_data user_data
        @app.shift_rostering_loaded?
      end
    end

    it 'to login to application', 
      story: 'Test',
      severity: :normal,
      testId: 'https://jira.quartileone.com/browse/YGCC-2290',
      issue: 'https://jira.quartileone.com/browse/YGCC-1290' do |e|
      e.step 'step1' do
        @app.open
        s.attach_file "screenshot1", take_screenshot_as_file
      end
      e.step 'step2' do
        @app.login_as(user = BY_DEFAULT)
      end
      e.step 'step3' do
        @app.open_user_header_menu
      end
      e.step 'step4' do
        @app.open_user_profile
      end
      e.step 'step5' do
        @app.logout
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

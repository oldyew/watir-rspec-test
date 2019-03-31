#run the file with rspec -c filename
require 'spec_helper'

module YoungGuns
  include Page

  describe 'User', feature: 'General', severity: :normal, tag: 'End to End' do
    let(:user) { Model::User.new }
    let(:site) { Site.new }

    before(:step) do |s|
      puts "Before step #{s.current_step}"
    end

    after { Site.user = nil }

    it 'logins', story: 'Test', severity: :normal, testId: '', issue: '' do |e|
      site.create_user(user)

      SignIn.visit.submit_form(user)

      expect(site.logged_in?(user)).to eq true

      e.step 'Open Login page' do
        @auth_page.open
        s.attach_file 'screenshot1', take_screenshot_as_file
      end
      e.step 'step2' do
        @auth_page.login_as(user = BY_DEFAULT)
      end
      e.step 'step3' do
        @auth_page.open_user_header_menu
      end
      e.step 'step4' do
        @auth_page.open_user_profile
      end
      e.step 'step5' do
        @auth_page.logout
      end
    end

    it 'logout', story: 'Test', severity: :normal, testId: '', issue: '' do |e|
      site.login(user)

      Home.visit.sign_out_user

      expect(site.logged_in?(user)).to eq false

      e.step 'step1' do
        @auth_page.open
        s.attach_file "screenshot1", take_screenshot_as_file
      end
      e.step 'step2' do
        @auth_page.login_as(user = BY_DEFAULT)
      end
      e.step 'step5' do
        @auth_page.logout
      end
    end

    xit 'Reset password from Login Page', story: 'Test', severity: :normal, testId: '', issue: '' do |e|
      e.step 'step1' do
        @auth_page.open
        s.attach_file "screenshot1", take_screenshot_as_file
      end
      e.step 'step2' do
        @auth_page.open_reset_url
      end
      e.step 'step3' do
        @auth_page.fill_valid_reset_email(user = BY_RESET_USER)
      end
      e.step 'step4' do
        @auth_page.send_reset_email
      end
      e.step 'step5' do
        @auth_page.get_temporary_password(user=BY_RESET_USER, url=RESET_PASSWORD_SERVICE)
      end
      e.step 'step6' do
        @auth_page.provide_temporary_password
      end
      e.step 'step7' do
        @auth_page.submit_temporary_password(user=BY_RESET_USER)
      end
      e.step 'step8' do
        @auth_page.populate_fields_with_valid_password
      end
      e.step 'step9' do
        @auth_page.submit_new_password
      end
      e.step 'step10' do
        @auth_page.log_out
      end
      e.step 'step11' do
        @auth_page.login_as(user=BY_RESET_USER)
      end
    end
  end
end

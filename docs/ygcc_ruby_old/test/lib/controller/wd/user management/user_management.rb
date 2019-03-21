require './lib/model/user_management_model.rb'

def submit_login_data(login_data)
  text_field(formcontrolname: 'login').set(login_data[:login])
  login = text_field(formcontrolname: 'login')
  expect(login.value).to eq(login_data[:login])
  text_field(formcontrolname: 'password').set(login_data[:password])
  password = text_field(formcontrolname: 'password')
  expect(password.value).to eq(login_data[:password])
  sleep(5)
  button(class: 'login-form-button').click
  sleep(5)
end

def open_user_profile
  div(class: 'avatar-wrapper').click
  wd = div(class: 'controls')
  expect(wd.present?)
  button(class: 'ygcc-button', index: 0).click
  expect(text.include? $login_data[:login])
end

def open_password
  span(class: 'ygcc-tab-bar__tab-title', index: 1).click
end

def submit_reset_password(login_data)
  @browser.div(class: 'reset-password').click
  sleep(5)
  expect(@browser.text_field(formcontrolname: 'emailOrPhone').present?)
  @browser.text_field(formcontrolname: 'emailOrPhone').set(login_data[:login])
  @browser.button(class: 'login-form-button').click
  sleep(5)
  @browser.text_field(formcontrolname: 'tempPassword').set(login_data[:password])
  @browser.button(class: 'login-form-button').click
  sleep(5)
  expect(@browser.text.include? login_data[:login])
end

def submit_password_setting(password_setting)
  @browser.text_field(formcontrolname: 'currentPassword').set(password_setting[:current_password])
  expect(@browser.text_field(formcontrolname: 'currentPassword').value).to eq(password_setting[:current_password])
  @browser.text_field(formcontrolname: 'newPassword').set(password_setting[:new_password])
  expect(@browser.text_field(formcontrolname: 'newPassword').value).to eq(password_setting[:new_password])
  @browser.text_field(formcontrolname: 'repeatNewPassword').set(password_setting[:confirm_password])
  expect(@browser.text_field(formcontrolname: 'repeatNewPassword').value).to eq(password_setting[:confirm_password])
  sleep(5)
  @browser.button(class: 'button-confirm').click
  sleep(5)
  
end

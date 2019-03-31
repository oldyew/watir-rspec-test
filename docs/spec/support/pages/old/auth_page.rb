require './lib/component/login/login_page'

# Login actions class
class Login
  def initialize(browser)
    @browser = browser
    @login = LoginPage.new
    @reset = ResetPage.new
    @roster_header = RosterHeader.new
    @main_header = MainHeader.new
    @user_profile = UserProfile.new
    @password_setting_page = PasswordSettingPage.new
  end

  by_default_email = BY_DEFAULT.email
  by_reset_email = BY_RESET_USER.email
  temporary_password = None

  def open
    @browser.goto ''
    @login.loaded?
  end

  def email_input.enabled?
    expect(@login_page.email_input).enabled?
  end

  def loaded?
    expect(@login_page.button_title).to eq('Log in')
  end

  def submit_login_data(user)
    @login_page.login_input.set user.email
    expect(@login_page.login_input.value).to eq user.email
    @login_page.password_input.set user.password
    expect(@login_page.password_input.value).to eq user.password
    sleep(5)
    @login_page.submit_login
    sleep(5)
  end

  def shift_rostering_loaded?
    expect(@login_page.shift_rostering_page_title).to eq('Shift Roster')
  end

  # def open_user_profile
  #   @browser.div(class: 'avatar-wrapper').click
  #   expect(@browser.div(class: 'controls').present?)
  #   @browser.button(class: 'ygcc-button', index: 0).click
  #   expect(@browser.text.include? $login_data[:login])
  # end

  # def open_password
  #   @browser.span(class: 'ygcc-tab-bar__tab-title', index: 1).click
  # end

  # def submit_reset_password(login_data)
  #   @browser.div(class: 'reset-password').click
  #   sleep(5)
  #   expect(@browser.text_field(formcontrolname: 'emailOrPhone').present?)
  #   @browser.text_field(formcontrolname: 'emailOrPhone').set(login_data[:login])
  #   @browser.button(class: 'login-form-button').click
  #   sleep(5)
  #   @browser.text_field(formcontrolname: 'tempPassword').set(login_data[:password])
  #   @browser.button(class: 'login-form-button').click
  #   sleep(5)
  #   expect(@browser.text.include? login_data[:login])
  # end

  # def submit_password_setting(password_setting)
  #   @browser.text_field(formcontrolname: 'currentPassword').set(password_setting[:current_password])
  #   expect(@browser.text_field(formcontrolname: 'currentPassword').value).to eq(password_setting[:current_password])
  #   @browser.text_field(formcontrolname: 'newPassword').set(password_setting[:new_password])
  #   expect(@browser.text_field(formcontrolname: 'newPassword').value).to eq(password_setting[:new_password])
  #   @browser.text_field(formcontrolname: 'repeatNewPassword').set(password_setting[:confirm_password])
  #   expect(@browser.text_field(formcontrolname: 'repeatNewPassword').value).to eq(password_setting[:confirm_password])
  #   sleep(5)
  #   @browser.button(class: 'button-confirm').click
  #   sleep(5)
  # end



  def button_title
    @browser.button(class: 'login-form-button').text
  end

  def login_input
    @browser.text_field(formcontrolname: 'login')
  end

  def password_input
    @browser.text_field(formcontrolname: 'password')
  end

  def submit_login
    @browser.button(class: 'login-form-button').click
  end

  def shift_rostering_page_title
    @browser.div(class: 'title').text
  end
end

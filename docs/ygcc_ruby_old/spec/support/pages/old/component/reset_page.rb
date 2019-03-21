# Home Page class
class ResetPage
  def initialize
    self.title = title('.first-step__title')

    self.email_field = text_field(css: '[formcontrolname="emailOrPhone"]')
    self.send_code_button = button(css: '.login-form-button')
    self.loader_send_button = self.send_code_button.s(css: '.ygcc-spinner')

    # password reset page
    self.password_field = s('[formcontrolname="tempPassword"]')
    self.login_button = s('.login-form-button')

    # mailinator page
    self.email_input = s('[placeholder="Check Any Inbox!"]')
    self.go_button = s(by.text('Go!'))
    self.table = s('.table-responsive')
    self.first_list_with_temporary_subject_text = ss(by.text('Temporary password'))[0]
    # message mailinator iframe
    self.iframe_message = s('#msg_body')
    self.delete_icon = s('[title="Delete Emails"]')

    # user profile page
    self.user_profile_title = s('.page-title-wrapper')
    self.personal_details_title = s('.ygcc-tab-bar__tab .ygcc-tab-bar__tab-title')
    self.security_and_password_active_title = s('.ygcc-tab-bar__tab--active .ygcc-tab-bar__tab-title')
    self.security_and_password_title = s(by.text('Security and Password'))

    self.new_password_title = s(by.text('New Password'))
    self.confirm_password_title = s(by.text('Confirm Password'))
    self.new_password_input = s('[formcontrolname="newPassword"]')
    self.confirm_password_input = s('[formcontrolname="repeatNewPassword"]')
    self.new_password_required_icon = self.new_password_title.s('.required-asterisk')
    self.confirm_password_required_icon = self.confirm_password_title.s('.required-asterisk')

    self.confirm_button = s('.button-confirm')
    self.notification_message = s('.password-setting-form .ygcc-notification__message')
    self.success_message = s('.footer-container .ygcc-notification__message')

    # personal details page
    self.info_name = s('.ygcc-personal-main-info__name')
  end
end
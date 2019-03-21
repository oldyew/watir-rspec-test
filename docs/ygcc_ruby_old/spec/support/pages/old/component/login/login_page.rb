# Login Page class
class LoginPage
  def initialize
    self.email_input = text_field(css: '[formcontrolname="login"]')
    @password_input = text_field(css: '[formcontrolname="password"]')
    @login_button = button(css: '.ygcc-button__label')
    @form_loader = element(css: '.login-form-button .ygcc-spinner')
    @reset_link = link(css: '.reset-password span')
    @welcome_text = element(css: '.welcome__text')
  end
end

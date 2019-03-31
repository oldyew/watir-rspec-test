# spec
site = Site.new(Watir::Browser.new)

login_page = site.login_page.open
user_page = login_page.login_as "Mom", "s3cr3t"

user_page.should be_logged_in

# page object
class BrowserContainer
    def initialize(browser)
        @browser = browser
    end
end

class Site < BrowserContainer

    def login_page
    @login_page = LoginPage.new(@browser)
    end

def user_page
    @user_page = UserPage.new(@browser)
end

def close
    @browser.close
end
end # Site

class LoginPage < BrowserContainer
URL = "http://example.com/login"

def open
    @browser.goto URL
    self
end

def login_as(user, pass)
    user_field.set user
    password_field.set pass

    login_button.click

    next_page = UserPage.new(@browser)
    Watir::Wait.until { next_page.loaded? }

    next_page
end

private

def user_field
    @browser.text_field(:name => "user")
end

def password_field
    @browser.text_field(:name => "pass")
end

def login_button
    @browser.button(:id => "login")
end
end # LoginPage

class UserPage < BrowserContainer
def logged_in?
    logged_in_element.exists?
end

def loaded?
    @browser.title == "Your Profile"
end

private

def logged_in_element
    @browser.div(:id => "logged-in")
end
end # UserPage

# Assersions
class SomePage
def loaded?
    some_element.exists?
end
end

it "should be loaded" do
page.should be_loaded
end
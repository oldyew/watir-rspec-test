require 'watir'
require 'webdriver-user-agent'
driver = Webdriver::UserAgent.driver(browser: :chrome, agent: :iphone, orientation: :landscape)
browser = Watir::Browser.new driver
browser.goto 'tiffany.com'
browser.url.should == 'http://m.tiffany.com/International.aspx'
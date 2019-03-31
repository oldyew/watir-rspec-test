
require 'watir'

class Location

  def initialize(browser)
    @browser = browser
  end

  def select_country(country)
    expect(@browser.div(:text, 'Country')).to be_present
    @browser.div(:text, 'Country').click
    expect(@browser.div(:text, country)).to be_present
    @browser.div(:text, country).click
  end

  def select_city(city)
    expect(@browser.div(:text, 'City')).to be_present
    @browser.div(:text, 'City').click
    expect(@browser.div(:text, city)).to be_present
    @browser.div(:text, city).click
  end

  def select_area(area)
    expect(@browser.div(:text, 'Area')).to be_present
    @browser.div(:text, 'Area').click
    expect(@browser.div(:text, area)).to be_present
    @browser.div(:text, area).click
  end

end

location = Location.new
location.select_country('Australia')
expect(@browser.div(:text, 'Australia')).to be_present

location.select_city('Qld')
expect(@browser.div(:text, 'Qld')).to be_present

location.select_area('Ahuriri')
expect(@browser.div(:text, 'Ahuriri')).to be_present

# select Site
expect(@browser.div(:text, 'Add Site')).to be_present
@browser.div(:text, 'Add Site').click
expect(@browser.div(:text, 'Bunnings')).to be_present
@browser.div(:text, 'Bunnings').click
expect(@browser.div(:css, 'div.name-wrapper > ygcc-tooltip-typo-ellipsis > div > div:nth-child(1)').exist?).to be false
@browser.div(:text, 'Bunnings').click



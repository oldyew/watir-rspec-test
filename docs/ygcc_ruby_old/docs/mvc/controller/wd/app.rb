require 'watir'
require "webdriver_manager" #ability to have WebDriver binary drivers downloaded automatically
require 'rspec/expectations'
# require '../../view/ui/dashboard/location'
require '../../../mvc/view/ui/charge_calculation'
require '../../../mvc/view/ui/wage_calculation'
require '../../../mvc/view/ui/team_member/team_member_details'
require '../../../mvc/view/ui/team_member/team_member_list'

include RSpec::Matchers

class Application

  attr_accessor :browser

  def initialize
    @browser = Watir::Browser.new :chrome
    @browser.driver.manage.timeouts.implicit_wait = 10
    @base_url = 'https://ygcc-qa-portal.azurewebsites.net'
    # @location = Location.new @browser
    @charge = ChargeCalculation.new @browser
    @wage = WageCalculation.new @browser
    @team_member_details = TeamMemberDetails.new @browser
    @team_member_list = TeamMemberList.new @browser

  end

  def quit
    @browser.quit unless browser.nil?
  end

  def resize_browser_window
    #expect(@browser).to be_present
    @browser.window.resize_to(1920, 1080)
    expect(@browser.window.size.width).to eq(1920)
    expect(@browser.window.size.height).to eq(1080)
  end

  def open_application
    @browser.goto @base_url
    expect(@browser.url).to eql(@base_url + '/login')
    expect(@browser.title).to eq('YgccPortal')
  end

  def login
    expect(@browser.button(:text, 'FB Login')).to be_present
    @browser.button(:text, 'FB Login').click
  end

  def open_team_member_section
    @browser.goto @base_url + '/employees'
    self.resize_browser_window
  end

  def open_shift_rostering
    @browser.goto @base_url + '/shift-rostering'
    expect(@browser.div(:class, 'title').text).to eq('Team Roster')
  end

  def open_customer_list
    @browser.goto @base_url + '/customers-list'
    expect(browser.button(:css, 'div.customers-list__button-wrapper > button')).to be_present
  end

  def open_charge_calculator
    @browser.goto 'https://ygcc-dev-chargedummyui.azurewebsites.net/'
  end

  def submit_charge_calculation_data(charge)
    @charge.open
    @charge.select_shift_type charge.shift_type
    @charge.select_day_type charge.day_type
    @charge.select_shift_date charge.shift_date
    @charge.input_downtime charge.downtime
    @charge.input_other_charges charge.other_charges
    @charge.input_crew_members charge.crew_members
    @charge.input_container_number charge.container_number
    @charge.select_load_type charge.load_type
    @charge.select_container_size charge.container_size
    @charge.select_work_type charge.work_type
    @charge.input_cartons charge.cartons
    @charge.input_pallets charge.pallets
    @charge.input_codes charge.codes
    @charge.submit
    sleep 3
    # check that control is present

  end

  def verify_charge_calculation
    expect(@browser.element(:css, '#containers > div:nth-child(2) > div:nth-child(1) > div:nth-child(2)').text).to eq('314.29')
    expect(@browser.element(:css, '#others > div:nth-child(2) > div > div:nth-child(1)').text).to eq('191.04')
    expect(@browser.element(:css, '#others > div:nth-child(2) > div > div:nth-child(2)').text).to eq('105.42')
    expect(@browser.element(:css, '#total > span').text).to eq('1867.91')
  end

  def submit_wage_calculation_data(wage)
    @wage.open
    @wage.input_rookies wage.rookies
    @wage.input_level2 wage.level2
    @wage.input_crew_leads wage.crew_leads
    @wage.input_government_workers wage.government_workers
    @wage.input_site_managers_salaried wage.site_managers_salaried
    @wage.input_site_managers_contract wage.site_managers_contract
    @wage.select_shift_type wage.shift_type
    @wage.select_shift_date wage.shift_date
    @wage.select_day_type wage.day_type
    @wage.select_start_time wage.start_time
    @wage.select_finish_time wage.finish_time
    @wage.input_downtime wage.downtime
    @wage.input_other_charges wage.other_charges
    @wage.input_container_number wage.container_number
    @wage.select_load_type wage.load_type
    @wage.select_container_size wage.container_size
    @wage.select_work_type wage.work_type
    @wage.input_cartons wage.cartons
    @wage.input_pallets wage.pallets
    @wage.input_codes wage.codes
    @wage.submit
    sleep 3
    # check that control is present

  end

  def verify_charge_calculation
    expect(@browser.element(:css, '#containers > div:nth-child(2) > div:nth-child(1) > div:nth-child(2)').text).to eq('314.29')
    expect(@browser.element(:css, '#others > div:nth-child(2) > div > div:nth-child(1)').text).to eq('191.04')
    expect(@browser.element(:css, '#others > div:nth-child(2) > div > div:nth-child(2)').text).to eq('105.42')
    expect(@browser.element(:css, '#total > span').text).to eq('1867.91')
  end
end

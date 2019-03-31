
require 'watir'

class WageCalculation

  def initialize(browser)
    @browser = browser
  end

  def open
    @browser.goto 'http://ygcc-dev-wagedummyui.azurewebsites.net/'
  end

  def input_rookies(rookies)
    @browser.text_field(:id, 'rookies').set(rookies.to_s)
  end

  def input_level2(level2)
    @browser.text_field(:id, 'level2').set(level2.to_s)
  end

  def input_crew_leads(crew_leads)
    @browser.text_field(:id, 'crewLeads').set(crew_leads.to_s)
  end

  def input_government_workers(government_workers)
    @browser.text_field(:id, 'governmentWorkers').set(government_workers.to_s)
  end

  def input_site_managers_salaried(site_managers_salaried)
    @browser.text_field(:id, 'siteManagersSalaried').set(site_managers_salaried.to_s)
  end

  def input_site_managers_contract(site_managers_contract)
    @browser.text_field(:id, 'siteManagersNonSalaried').set(site_managers_contract.to_s)
  end

  def select_shift_type(shift_type)
    @browser.select_list(:id, 'shiftType').select(shift_type.to_s)
  end

  def select_day_type(day_type)
    @browser.select_list(:id, 'dayType').select(day_type.to_s)
  end

  def select_shift_date(shift_date)
    @browser.driver.find_element(:id, 'shiftDate').send_keys(shift_date.to_s)
  end

  def select_start_time(start_time)
    @browser.driver.find_element(:id, 'startTime').send_keys(start_time.to_s)
  end

  def select_finish_time(finish_time)
    @browser.driver.find_element(:id, 'finishTime').send_keys(finish_time.to_s)
  end

  def input_downtime(downtime)
    @browser.text_field(:id, 'downtimeHours').set(downtime.to_s)
  end

  def input_other_charges(other_charges)
    @browser.text_field(:id, 'casualHoursNumber').set(other_charges.to_s)
  end

  def input_container_number(container_number)
    @browser.text_field(:id, 'containersNumber').set(container_number.to_s)
  end

  def select_load_type(load_type)
    @browser.select_list(:id, 'loadType').select(load_type.to_s)
  end

  def select_container_size(container_size)
    @browser.select_list(:id, 'containerSize').select(container_size.to_s)
  end

  def select_work_type(work_type)
    @browser.select_list(:id, 'workType').select(work_type.to_s)
  end

  def input_cartons(cartons)
    @browser.text_field(:id, 'cartons').set(cartons.to_s)
  end

  def input_pallets(pallets)
    @browser.text_field(:id, 'pallets').set(pallets.to_s)
  end

  def input_codes(codes)
    @browser.text_field(:id, 'codes').set(codes.to_s)
  end

  def submit
    @browser.element(:css, '#wageInput > input').click
  end

end
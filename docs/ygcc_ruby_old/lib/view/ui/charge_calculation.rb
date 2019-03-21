

class ChargeCalculation

  def initialize(browser)
    @browser = browser
  end

  def open
    @browser.goto 'url'
  end

  def select_shift_type(shift_type)
    @browser.select_list(:id, 'shiftType').select(shift_type.to_s)
  end

  def select_day_type(day_type)
    @browser.select_list(:id, 'isPublicHoliday').select(day_type.to_s)
  end

  def select_shift_date(shift_date)
    @browser.driver.find_element(:id, 'shiftDate').send_keys(shift_date.to_s)
  end

  def input_downtime(downtime)
    @browser.text_field(:id, 'downtimeHours').set(downtime.to_s)
  end

  def input_other_charges(other_charges)
    @browser.text_field(:id, 'casualHoursNumber').set(other_charges.to_s)
  end

  def input_crew_members(crew_members)
    @browser.text_field(:id, 'crewMembersAmount').set(crew_members.to_s)
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
    @browser.button(:css, '#chargeInput > input').click
  end

end
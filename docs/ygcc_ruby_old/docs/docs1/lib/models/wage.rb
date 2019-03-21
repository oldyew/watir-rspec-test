
class Wage

    attr_reader :rookies
    attr_reader :level2
    attr_reader :crew_leads
    attr_reader :government_workers
    attr_reader :site_managers_salaried
    attr_reader :site_managers_contract
    attr_reader :shift_type
    attr_reader :shift_date
    attr_reader :day_type
    attr_reader :start_time
    attr_reader :finish_time
    attr_reader :downtime
    attr_reader :other_charges
    attr_reader :crew_members
    attr_reader :container_number
    attr_reader :load_type
    attr_reader :container_size
    attr_reader :work_type
    attr_reader :cartons
    attr_reader :pallets
    attr_reader :codes
  
    def initialize(rookies: nil, level2: nil, crew_leads: nil, government_workers: nil, 
                   site_managers_salaried: nil, site_managers_contract: nil, 
                   shift_type: nil, shift_date: nil, day_type: nil, start_time: nil, 
                   finish_time: nil, downtime: nil, other_charges: nil, 
                   crew_members: nil, container_number: nil, load_type: nil, 
                   container_size: nil, work_type: nil, cartons: nil, pallets: nil, 
                   codes: nil)
                   @rookies = rookies
                   @level2 = level2
                   @crew_leads = crew_leads
                   @government_workers = government_workers
                   @site_managers_salaried = site_managers_salaried
                   @site_managers_salaried = site_managers_salaried               
                   @site_managers_contract = site_managers_contract
                   @shift_type = shift_type
                   @shift_date = shift_date
                   @day_type = day_type
                   @start_time = start_time
                   @finish_time = finish_time
                   @downtime = downtime
                   @other_charges = other_charges
                   @container_number = container_number
                   @load_type = load_type
                   @container_size = container_size
                   @work_type = work_type
                   @cartons = cartons
                   @pallets = pallets
                   @codes = codes
    end
  
  end
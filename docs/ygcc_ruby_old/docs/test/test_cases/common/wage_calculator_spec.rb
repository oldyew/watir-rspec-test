require '../config/setup'
require 'rspec'
require '../models/wage'
require 'pairwise'
require 'active_support/all'


container_data = [1, 2, 3],
                 [1, 2],
                 [Date.today.next_week(:tuesday).strftime('%m/%d/%Y'), 
                  Date.today.next_week(:saturday).strftime('%m/%d/%Y'), 
                  Date.today.next_week(:sunday).strftime('%m/%d/%Y')],
                 [nil, 1], 
                 [nil, 2], 
                 [5, 11], 
                 [1, 2], 
                 [1, 2], 
                 [2, 3], 
                 [100, 2502], 
                 [100, 2502], 
                 [100, 2502]
Pairwise.combinations(container_data).each do |(shift_type,
                                                day_type,
                                                shift_date,
                                                start_time,
                                                finish_time,
                                                downtime, 
                                                other_charges, 
                                                container_number, 
                                                load_type, 
                                                container_size, 
                                                work_type, 
                                                cartons, 
                                                pallets,
                                                codes)|
end

[Wage.new(rookies: rand(5), level2: rand(5), crew_leads: rand(2), government_workers: rand(1), 
          site_managers_salaried: rand(1), site_managers_contract: rand(1), 
          shift_type: shift_type, day_type: day_type, shift_date: shift_date, 
          start_time: start_time, finish_time: finish_time, downtime: downtime, 
          other_charges: other_charges, container_number: container_number,
          load_type: load_type, container_size: container_size, work_type: work_type, cartons: cartons,
          pallets: pallets, codes: codes)].each do |wage|

  describe 'User' do
    it 'should obtain wage calculation' do
      @app.submit_wage_calculation_data wage
      @app.verify_wage_calculation
    end
  end
end
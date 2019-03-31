
require '../config/setup'
require 'rspec'
require '../models/charge'
require 'pairwise'
require 'active_support/all'
require 'date'

Pairwise.combinations([1, 2, 3], [false, true], 
                      [Date.today.next_week(:tuesday).strftime('%m/%d/%Y'), 
                      Date.today.next_week(:saturday).strftime('%m/%d/%Y'), 
                      Date.today.next_week(:sunday).strftime('%m/%d/%Y')],
                      [nil, 1], [nil, 2], [5, 11], [1, 2], [1, 2], [2, 3], 
                      [100, 2502], [100, 2502], 
                      [100, 2502]).each do |(
                        shift_type,
                        day_type, 
                        shift_date,
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

[Charge.new(shift_type: shift_type, day_type: day_type, shift_date: shift_date, 
          downtime: downtime, other_charges: other_charges, crew_members: rand(10), 
          container_number: container_number, load_type: load_type, container_size: container_size, work_type: work_type, cartons: cartons,
          pallets: pallets, codes: codes)].each do |charge|

  describe 'User' do
    it 'should obtain charge calculation' do
      @app.submit_charge_calculation_data charge
      @app.verify_charge_calculation
    end
  end
end


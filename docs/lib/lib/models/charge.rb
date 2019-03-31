
class Charge

  attr_reader :shift_type
  attr_reader :shift_date
  attr_reader :day_type
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

  def initialize(shift_type: nil, shift_date: nil, day_type: nil, downtime: nil,
                 other_charges: nil, crew_members: nil, container_number: nil,
                 load_type: nil, container_size: nil, work_type: nil, cartons: nil,
                 pallets: nil, codes: nil)
    @shift_type = shift_type
    @shift_date = shift_date
    @day_type = day_type
    @downtime = downtime
    @other_charges = other_charges
    @crew_members = crew_members
    @container_number = container_number
    @load_type = load_type
    @container_size = container_size
    @work_type = work_type
    @cartons = cartons
    @pallets = pallets
    @codes = codes
  end

end
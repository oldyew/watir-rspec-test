# Installation

$ gem install ui2api

# Usage

# Set the base url

UI2API::Base.base_url = 'https://restful-booker.herokuapp.com'

# Create a subclass with an endpoint:

module API
  class Booking < UI2API::Base
    def self.endpoint
      'booking'
    end
  end
end

# Make API calls

booking = {firstname: 'Trey',
           lastname: 'Ruecker',
           totalprice: 83,
           depositpaid: true,
           bookingdates: {checkin: '3/23/2019',
                          checkout: '3/27/2019'}}
 
API::Booking.create(booking)

# The Array or Hash of results is accessed with #data

booking = {firstname: 'David',
           lastname: 'Jones',
           totalprice: 183,
           depositpaid: true,
           bookingdates: {checkin: '3/23/2019',
                          checkout: '3/27/2019'}}
 
created_booking = API::Booking.create(booking)
booking_id = created_booking.data[:bookingid]
 
stored_booking = API::Booking.show(id: booking_id).data
 
expect(stored_booking).to eq booking

# Use Watir Model

# Note that the code in the previous example will actually fail. This is because we are storing dates as String values and the input String does not match the output String

# Hashes are hard to compare, which is why we have WatirModel. WatirModel is designed to store the canonical representation of related data in the appropriate data type, specifically so that data can be correctly compared.

module Model
  class BookingDates < WatirModel
    key(:checkin, data_type: Date) { Faker::Date.forward }
    key(:checkout, data_type: Date) { checkin + 4 }
  end
 
  class Booking < WatirModel
    key(:firstname) { Faker::Name.first_name }
    key(:lastname) { Faker::Name.last_name }
    key(:totalprice, data_type: Integer) { Faker::Commerce.price.round }
    key(:depositpaid) { true }
    key(:bookingdates, data_type: BookingDates) { BookingDates.new }
    key(:additionalneeds)
  end
end

# Because we have a model class defined that is named the same as the API class, UI2API will automatically attempt to create an instance of the model from the return value of the API call. It is accessible from a method based on the name of the API/Model classes, so in this case #booking:

booking = Model::Booking.new
 
created_booking = API::Booking.create(booking)
booking_id = created_booking.data[:bookingid]
 
stored_booking = API::Booking.show(id: booking_id).booking
 
expect(stored_booking).to eq booking

# Customize

# You have a subclass, so if you need to add or change things before or after a call, just override the UI2API method in your subclass:

module API
  class Booking < UI2API::Base
  
    attr_reader :id
    
    def initialize(*)
      super
      return if @data.is_a?(Array)
      @id = @data[:bookingid]
    end
  end
end

# Now we can use this like so:

booking = Model::Booking.new
 
created_booking = API::Booking.create(booking)
 
expect(created_booking.id).to eq created_booking.data[:bookingid]

# Because this pattern comes in very handy, you can use #define_attribute to do the same thing:

module API
  class Booking < UI2API::Base
    def initialize(*)
      super
      return if @data.is_a?(Array)
      define_attribute(:id, @data[:bookingid])
    end
  end
end
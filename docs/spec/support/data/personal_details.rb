module YoungGuns
  module Model
    class PersonalDetails < Base
      key(:first_name) { Faker::Name.first_name }
      key(:last_name) { Faker::Name.last_name }
      key(:date_of_birth) { Faker::Date.birthday }
      key(:street, api: :address1) { Faker::Address.street_address }
      key(:city) { Faker::Address.city }
      key(:state) { Faker::Address.state }
      key(:post_code) { Faker::Address.zip }
      key(:country) { Faker::Address.city }
    end
  end
end

module YoungGuns
  module Model
    class User < Base
      key(:email_address, api: :email) { Faker::Internet.email }
      key(:password) { Faker::Internet.password }
      key(:phone) { Faker::Internet.phone }
    end
  end
end

# email: 'ytarasov@quartileone.com', password: 'Test@1234',
# street: '123, Test st.', city: 'Perth', postcode: '12345',
# country: 'Australia', state: 'WA', firstname: 'Yuri', lastname: 'Tarasov',
# phone: '322223332', dateofbirth: '10/04/1976'

# User.new(email: 'ytarasov2@quartileone.com', password: 'qazwsX1!')

# BY_DEFAULT = User.new(email: 'ytarasov@quartileone.com', password: 'Test@123')
# BY_RESET_USER = User.new(email: 'yg_reset_user@mailinator.com', password: 'qazwsX1!')

# db
# json
# yml
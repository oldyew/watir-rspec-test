module YoungGuns
  module Model
    class User < Base
      key(:email_address, api: :email) { Faker::Internet.email }
      key(:password) { Faker::Internet.password }
      key(:phone) { Faker::Internet.phone }
    end
  end
end

# email: '', password: '',
# street: '123, Test st.', city: 'Perth', postcode: '12345',
# country: 'Australia', state: 'WA', firstname: '', lastname: '',
# phone: '322223332', dateofbirth: ''

# User.new(email: '', password: '')

# BY_DEFAULT = User.new(email: '', password: '')
# BY_RESET_USER = User.new(email: '', password: '')

# db
# json
# yml

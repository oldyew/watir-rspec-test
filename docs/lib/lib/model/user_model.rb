# User class
class User
  attr_reader :street
  attr_reader :postcode
  attr_reader :city
  attr_reader :country
  attr_reader :state
  attr_reader :email
  attr_reader :phone
  attr_reader :password
  attr_reader :firstname
  attr_reader :lastname
  attr_reader :dateofbirth

  def initialize(
    firstname: nil, lastname: nil, street: nil, postcode: nil, city: nil,
    country: nil, state: nil, email: nil, phone: nil, password: nil,
  )
    @street = street
    @postcode = postcode
    @city = city
    @country = country
    @state = state
    @email = email
    @phone = phone
    @password = password
    @firstname = firstname
    @lastname = lastname
    @dateofbirth = dateofbirth
  end
end

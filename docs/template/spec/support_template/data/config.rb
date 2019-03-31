module AddressBook
  module Model
    class Config < ::ConfigModel
      key(:base_url) { 'https://address-book-example.herokuapp.com' }
    end
  end
end

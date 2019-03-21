module YoungGuns
  module Model
    class Config < ::ConfigModel
      key(:base_url) { 'https://ygcc-qa-portal.azurewebsites.net' }
    end
  end
end

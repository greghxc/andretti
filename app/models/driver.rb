
require 'httparty'

class Driver
  include HTTParty

  def base_path
    "/aces/acestowncarservice.com/acesver3/API/resources/reservation/"
  end

  def info_for(driver)
    api_base = Rails.configuration.aces_legacy_api
    url = api_base + base_path
    options = {
      :body => [
        { name: 'type', value: 'driverInfo'},
        { name: 'driver', value: driver}
      ].to_json
    }

    JSON.parse(HTTParty.post(url,options)) || []
  end
end

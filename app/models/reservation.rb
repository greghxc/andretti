require 'httparty'

class Reservation
  include HTTParty
  # base_uri 'localhost:8000'

  def base_path
    "/aces/acestowncarservice.com/acesver3/API/resources/reservation/"
  end

  def list_by_driver(driver)
    api_base = Rails.configuration.aces_legacy_api
    url = api_base + base_path
    options = {
      :body => [
        { name: 'type', value: 'listByDriver'},
        { name: 'driver', value: driver }
      ].to_json
    }
    # self.class.post(url, options)
    JSON.parse(HTTParty.post(url,options))
  end
end

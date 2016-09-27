class DriversController < ApplicationController
  def index
    driver = params[:driver]
    driver_client = Driver.new
    @driver = driver_client.info_for(driver)

    res_client = Reservation.new
    @reservations = res_client.list_by_driver(driver)
  end
end

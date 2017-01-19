require 'time'
class DriversController < ApplicationController
  helper_method :parse_time

  def index
    driver = params[:driver]
    driver_client = Driver.new
    @driver = driver_client.info_for(driver)

    res_client = Reservation.new
    @reservations = res_client.list_by_driver(driver)
  end

  def parse_time(reservation)
    Time.parse(reservation['res_arr_time'])
  rescue
    Time.parse(reservation['res_datetime'])
  end
end

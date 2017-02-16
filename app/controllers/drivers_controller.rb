require 'time'
class DriversController < ApplicationController
  helper_method :parse_time

  def index
    driver = params[:driver]
    token = params[:token]
    driver_client = Driver.new
    @driver = driver_client.info_for(driver, token)
    unless @driver.empty?
      res_client = Reservation.new
      @reservations = res_client.list_by_driver(driver)
    else
      render template: 'drivers/error'
    end
  end

  def parse_time(reservation)
    Time.parse(reservation['res_arr_time'])
  rescue
    Time.parse(reservation['res_datetime'])
  end
end

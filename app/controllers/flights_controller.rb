class FlightsController < ApplicationController
  def show
    @flight = Flight.find(params[:id])
    @airline = Airline.find(@flight.airline_id)
    @passengers = @flight.passengers
  end
end

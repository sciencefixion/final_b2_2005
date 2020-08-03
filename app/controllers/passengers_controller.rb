class PassengersController < ApplicationController
  def show
    @passenger = Passenger.find(params[:id])
    @flights = @passenger.flights
  end
end

class PassengersController < ApplicationController
  def show
    @passenger = Passenger.find(params[:id])
    @flights = @passenger.flights
  end

  def update
    @passenger = Passenger.find(params[:id])

    @new_flight = Flight.where("number = :number", number: params[:flight_number])
    @passenger.flights << @new_flight
    # FlightPassenger.new(flight: @new_flight, passenger: @passenger)
    redirect_to "/passengers/#{@passenger.id}"

  end
end

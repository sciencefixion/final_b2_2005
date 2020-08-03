require 'rails_helper'

RSpec.describe 'Flights show page', type: :feature do
  before(:each) do
    @airline = Airline.create!(name: "Delta")
    @flight = @airline.flights.create!(number: "1727", date: "08-03-20", time: "3:30pm MST", departure_city: "Denver", arrival_city: "Reno")
    @joe = Passenger.create!(name: "Joe", age: "7")
    @bob = Passenger.create!(name: "Bob", age: "77")


    FlightPassenger.create!(flight: @flight, passenger: @joe)
    FlightPassenger.create!(flight: @flight, passenger: @bob)


  end
  it 'shows flight info' do
    visit "/flights/#{@flight.id}"

    expect(page).to have_content(@flight.number)
    expect(page).to have_content(@flight.date)
    expect(page).to have_content(@flight.time)
    expect(page).to have_content(@flight.departure_city)
    expect(page).to have_content(@flight.arrival_city)
    expect(page).to have_content(@airline.name)
    expect(page).to have_content("Joe")
    expect(page).to have_content("Bob")

  end

end

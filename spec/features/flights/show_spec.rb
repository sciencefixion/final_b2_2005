require 'rails_helper'

RSpec.describe 'Flights show page', type: :feature do
  before(:each) do
    @airline = Airline.create!(name: "Delta")
    @flight1 = @airline.flights.create!(number: "1727", date: "08-03-20", time: "3:30pm MST", departure_city: "Denver", arrival_city: "Reno")
    @flight2 = @airline.flights.create!(number: "7777", date: "08-03-20", time: "8:30pm MST", departure_city: "Reno", arrival_city: "Seattle")
    @flight3 = @airline.flights.create!(number: "1776", date: "08-04-20", time: "8:30am PST", departure_city: "Seattle", arrival_city: "Houston")

    @joe = Passenger.create!(name: "Joe", age: "7")
    @bob = Passenger.create!(name: "Bob", age: "77")
    @joey = Passenger.create!(name: "Joey", age: "7")
    @bobby = Passenger.create!(name: "Bobby", age: "77")


    FlightPassenger.create!(flight: @flight1, passenger: @joe)
    FlightPassenger.create!(flight: @flight1, passenger: @bob)

    FlightPassenger.create!(flight: @flight1, passenger: @joey)
    FlightPassenger.create!(flight: @flight1, passenger: @bobby)

    FlightPassenger.create!(flight: @flight2, passenger: @joe)
    FlightPassenger.create!(flight: @flight2, passenger: @bob)


  end
  it 'shows flight info' do
    visit "/flights/#{@flight1.id}"

    expect(page).to have_content(@flight1.number)
    expect(page).to have_content(@flight1.date)
    expect(page).to have_content(@flight1.time)
    expect(page).to have_content(@flight1.departure_city)
    expect(page).to have_content(@flight1.arrival_city)
    expect(page).to have_content(@airline.name)
    expect(page).to have_content("Joe")
    expect(page).to have_content("Bob")

  end

  it "shows number of minors and adults" do
    visit "/flights/#{@flight1.id}"


    expect(page).to have_content("Adults: 2")

    expect(page).to have_content("Minors: 2")
  end

end

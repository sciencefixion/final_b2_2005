require 'rails_helper'

RSpec.describe 'Passenger show page', type: :feature do
  before(:each) do
    @airline = Airline.create!(name: "Delta")
    @flight1 = @airline.flights.create!(number: "1727", date: "08-03-20", time: "3:30pm MST", departure_city: "Denver", arrival_city: "Reno")
    @flight2 = @airline.flights.create!(number: "7777", date: "08-03-20", time: "8:30pm MST", departure_city: "Reno", arrival_city: "Seattle")
    @flight3 = @airline.flights.create!(number: "1776", date: "08-04-20", time: "8:30am PST", departure_city: "Seattle", arrival_city: "Houston")

    @joe = Passenger.create!(name: "Joe", age: "7")
    @bob = Passenger.create!(name: "Bob", age: "77")


    FlightPassenger.create!(flight: @flight1, passenger: @joe)
    FlightPassenger.create!(flight: @flight1, passenger: @bob)

    FlightPassenger.create!(flight: @flight2, passenger: @joe)
    FlightPassenger.create!(flight: @flight2, passenger: @bob)


  end
  it 'shows passenger info' do
    visit "/passengers/#{@bob.id}"

    expect(page).to have_content("Bob")
    expect(page).to have_link(@flight1.number)
    expect(page).to have_link(@flight2.number)


  end

  it "allows flight assignment" do
    visit "/passengers/#{@bob.id}"

    fill_in 'Flight number', with: '1776'
    click_button 'Submit'



    expect(current_path).to eq("/passengers/#{@bob.id}")
    expect(page).to have_link(@flight3.number)

  end

end

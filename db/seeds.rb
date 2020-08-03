# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
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

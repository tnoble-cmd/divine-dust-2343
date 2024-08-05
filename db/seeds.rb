# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
    @airline = Airline.create!(name: "Southwest")
    @airline_2 = Airline.create!(name: "United")

    @flight = @airline.flights.create!(number: "123", date: "08/05/2024", departure_city: "Denver", arrival_city: "Reno")
    @flight_2 = @airline_2.flights.create!(number: "456", date: "08/05/2024", departure_city: "Reno", arrival_city: "Denver")
    
    @passenger_1 = Passenger.create!(name: "Joe")
    @passenger_2 = Passenger.create!(name: "Sally")
    @passenger_3 = Passenger.create!(name: "Bob")
    @passenger_4 = Passenger.create!(name: "Jill")

    FlightPassenger.create!(flight_id: @flight.id, passenger_id: @passenger_1.id)
    FlightPassenger.create!(flight_id: @flight.id, passenger_id: @passenger_2.id)
    FlightPassenger.create!(flight_id: @flight_2.id, passenger_id: @passenger_3.id)
    FlightPassenger.create!(flight_id: @flight_2.id, passenger_id: @passenger_4.id) 
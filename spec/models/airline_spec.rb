require "rails_helper"

RSpec.describe Airline, type: :model do
  describe "relationships" do
    it { should have_many :flights }
    it { should have_many(:passengers).through(:flights) }
  end

  describe "instance methods" do
    it "#adult_passengers" do
      airline = Airline.create!(name: "Frontier")
      flight_1 = airline.flights.create!(number: "1727", date: "08/03/20", departure_city: "Denver", arrival_city: "Reno")
      flight_2 = airline.flights.create!(number: "7777", date: "08/03/20", departure_city: "Reno", arrival_city: "Denver")
      passenger_1 = flight_1.passengers.create!(name: "Joe", age: 7)
      passenger_2 = flight_1.passengers.create!(name: "Sally", age: 25)
      passenger_3 = flight_2.passengers.create!(name: "Fred", age: 18)
      passenger_4 = flight_2.passengers.create!(name: "Sam", age: 35)

      FlightPassenger.create!(flight: flight_1, passenger: passenger_1)
      FlightPassenger.create!(flight: flight_1, passenger: passenger_2)
      FlightPassenger.create!(flight: flight_2, passenger: passenger_3)
      FlightPassenger.create!(flight: flight_2, passenger: passenger_4)
      FlightPassenger.create!(flight: flight_2, passenger: passenger_2) #Sally is on two flights, but should only be listed once.

      expect(airline.adult_passengers).to eq([passenger_2, passenger_3, passenger_4]) #Sally, Fred, Sam, no duplicates. Also Joe is not shown due to age.
      
    end
  end
end

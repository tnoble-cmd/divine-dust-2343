require 'rails_helper'

RSpec.describe 'Airline Show Page' do
  before :each do
    @airline_1 = Airline.create!(name: "Frontier")
    @airline_2 = Airline.create!(name: "Delta")

    @flight_1 = @airline_1.flights.create!(number: "1727", date: "08/03/20", departure_city: "Denver", arrival_city: "Reno")
    @flight_2 = @airline_1.flights.create!(number: "1737", date: "08/03/20", departure_city: "Denver", arrival_city: "Reno")
    @flight_3 = @airline_2.flights.create!(number: "1747", date: "08/03/20", departure_city: "Denver", arrival_city: "Reno")

    @passenger_1 = Passenger.create!(name: "Joe", age: 7)
    @passenger_2 = Passenger.create!(name: "Sally", age: 25)
    @passenger_3 = Passenger.create!(name: "Bob", age: 35)
    @passenger_4 = Passenger.create!(name: "Jill", age: 45)

    FlightPassenger.create!(flight: @flight_1, passenger: @passenger_1)
    FlightPassenger.create!(flight: @flight_1, passenger: @passenger_2)
    FlightPassenger.create!(flight: @flight_2, passenger: @passenger_2) # Using Sally twice to test in my test on line 34.
    FlightPassenger.create!(flight: @flight_2, passenger: @passenger_3)
    FlightPassenger.create!(flight: @flight_2, passenger: @passenger_4)

  end

  it 'displays a list of adult passengers US3' do
    visit airline_path(@airline_1)

    expect(page).to have_content(@passenger_2.name)
    expect(page).to have_content(@passenger_3.name)
    expect(page).to have_content(@passenger_4.name)
    expect(page).to_not have_content(@passenger_1.name)
  end

  it 'displays a unique list of passengers' do
    visit airline_path(@airline_1)

    expect(page).to have_selector('li', text: @passenger_2.name, count: 1) # Sally should only be listed once.
    expect(page).to have_selector('li', text: @passenger_3.name, count: 1)
    expect(page).to have_selector('li', text: @passenger_4.name, count: 1)
  end
end
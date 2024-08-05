require 'rails_helper'

RSpec.describe 'flights index page' do
  before :each do
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

  end

  it 'can see a list of all flight required flight info US1' do
    visit flights_path

    within "#flight-info-list" do
      expect(page).to have_content(@flight.number)
      expect(page).to have_content(@flight_2.number)

      expect(page).to have_content(@passenger_1.name)
      expect(page).to have_content(@passenger_2.name)
      expect(page).to have_content(@passenger_3.name)
      expect(page).to have_content(@passenger_4.name)

      expect(page).to have_content(@airline.name)
      expect(page).to have_content(@airline_2.name)
    end
  end

  it 'can remove a passenger from a flight US2' do
    visit flights_path

    within "#flight-info-list" do
      expect(page).to have_content(@passenger_1.name)
      expect(page).to have_content(@passenger_2.name)
      expect(page).to have_content(@passenger_3.name)
      expect(page).to have_content(@passenger_4.name)

      expect(page).to have_content(@flight.number)
      expect(page).to have_content(@flight_2.number)

      expect(page).to have_content(@airline.name)
      expect(page).to have_content(@airline_2.name)
    end

    within "#flight-info-list" do
      first('.remove-passenger').click
    end

    expect(current_path).to eq(flights_path)

    within "#flight-info-list" do
      expect(page).to have_content(@flight.number)
      expect(page).to have_content(@flight_2.number)

      expect(page).to_not have_content(@passenger_1.name)
      expect(page).to have_content(@passenger_2.name)
      expect(page).to have_content(@passenger_3.name)
      expect(page).to have_content(@passenger_4.name)

      expect(page).to have_content(@airline.name)
      expect(page).to have_content(@airline_2.name)
    end
  end
end
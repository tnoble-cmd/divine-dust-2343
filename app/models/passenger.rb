class Passenger < ApplicationRecord
  has_many :flights, through: :flight_passengers
end
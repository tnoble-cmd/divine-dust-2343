class AddAgeToPassengers < ActiveRecord::Migration[7.1]
  def change
    add_column :passengers, :age, :integer
  end
end

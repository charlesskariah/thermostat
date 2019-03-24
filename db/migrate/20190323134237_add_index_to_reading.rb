class AddIndexToReading < ActiveRecord::Migration[5.2]
  def change
    add_index :readings, :thermostat_id
    add_index :readings, [:thermostat_id, :number]
    add_index :readings, [:thermostat_id, :temperature]
    add_index :readings, [:thermostat_id, :humidity]
    add_index :readings, [:thermostat_id, :battery_charge]
  end
end

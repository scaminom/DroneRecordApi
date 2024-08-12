class CreateDcChargingStations < ActiveRecord::Migration[7.1]
  def self.up
    create_table :dc_charging_stations do |t|
      t.datetime :registration_date, null: false
      t.float    :dc_current,        null: false
      t.float    :dc_power,          null: false

      t.references :drone, null: false, foreign_key: true
    end
  end

  def self.down
    drop_table :dc_charging_stations
  end
end

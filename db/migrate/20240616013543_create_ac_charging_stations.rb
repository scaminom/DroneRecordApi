class CreateAcChargingStations < ActiveRecord::Migration[7.1]
  def self.up
    create_table :ac_charging_stations do |t|
      t.datetime :registration_date, null: false
      t.float    :ac_current,        null: false
      t.float    :ac_power,          null: false

      t.references :drone, null: false, foreign_key: true
    end
  end

  def self.down
    drop_table :ac_charging_stations
  end
end

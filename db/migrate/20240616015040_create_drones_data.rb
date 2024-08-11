class CreateDronesData < ActiveRecord::Migration[7.1]
  def self.up
    create_table :drones_data do |t|
      t.datetime :registration_date,  null: false
      t.float    :voltage,            null: false
      t.float    :battery_percentage, null: false
      t.float    :current,            null: false
      t.string   :flight_mode,        null: false
      t.float    :speed,              null: false
      t.float    :altitude,           null: false
      t.float    :latitude,           null: false
      t.float    :longitude,          null: false

      t.references :drone, null: false, foreign_key: true
    end
  end

  def self.down
    drop_table :drones_data
  end
end

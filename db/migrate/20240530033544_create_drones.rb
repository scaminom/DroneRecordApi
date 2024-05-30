class CreateDrones < ActiveRecord::Migration[7.1]
  def self.up
    create_table :drones do |t|
      t.datetime :registration_date
      t.float :voltage
      t.float :current
      t.float :altitude
      t.float :speed
      t.string :flight_mode
      t.float :latitude
      t.float :longitude
      t.references :user, null: false, foreign_key: true
    end
  end

  def self.down
    drop_table :drones
  end
end

class CreateStations < ActiveRecord::Migration[7.1]
  def self.up
    create_table :stations do |t|
      t.datetime :registration_date
      t.float :currentAC
      t.float :voltage
      t.float :currentDC
      t.float :overall_consumption
      t.float :consumptionTX

      t.references :drone, null: false, foreign_key: true
    end
  end

  def self.down
    drop_table :stations
  end
end

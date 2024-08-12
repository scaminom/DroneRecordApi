class CreateSolarPanels < ActiveRecord::Migration[7.1]
  def self.up
    create_table :solar_panels do |t|
      t.datetime :registration_date, null: false
      t.float    :panel_voltage,     null: false
      t.float    :panel_current,     null: false
      t.float    :battery_voltage,   null: false
      t.float    :battery_current,   null: false
      t.float    :controller_voltage, null: false
      t.float    :controller_current, null: false

      t.references :drone, null: false, foreign_key: true
    end
  end

  def self.down
    drop_table :solar_panels
  end
end

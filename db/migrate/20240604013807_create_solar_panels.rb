class CreateSolarPanels < ActiveRecord::Migration[7.1]
  def self.up
    create_table :solar_panels do |t|
      t.datetime :fecha_registro
      t.float :vPan
      t.float :cPan
      t.float :vBat
      t.float :cBat
      t.float :vCar
      t.float :cCar
      t.references :drone, null: false, foreign_key: true
    end
  end

  def self.down
    drop_table :solar_panels
  end
end

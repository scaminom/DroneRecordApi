class CreateStations < ActiveRecord::Migration[7.1]
  def self.up
    create_table :stations do |t|
      t.datetime :fecha_registro
      t.float :corrienteAC
      t.float :voltajeDC
      t.float :corrienteDC
      t.float :consumo_general
      t.float :consumoTX

      t.references :drone, null: false, foreign_key: true
    end
  end

  def self.down
    drop_table :stations
  end
end

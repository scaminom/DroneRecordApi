class CreateDrones < ActiveRecord::Migration[7.1]
  def self.up
    create_table :drones do |t|
      t.datetime :fecha_registro
      t.float :voltaje
      t.float :corriente
      t.float :altitud
      t.float :velocidad
      t.string :modo_vuelo
      t.float :latitud
      t.float :longitud
      t.references :user, null: false, foreign_key: true
    end
  end

  def self.down
    drop_table :drones
  end
end

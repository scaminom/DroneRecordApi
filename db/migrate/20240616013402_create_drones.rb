class CreateDrones < ActiveRecord::Migration[7.1]
  def change
    create_table :drones do |t|
      t.string  :name, null: false
      t.string  :description
      t.string  :serial_number, null: false
      t.integer :drone_type, null: false
      t.float   :battery_capacity, null: false
      t.integer :board_type, null: false
      t.float   :max_wind_speed

      t.references :user, null: false, foreign_key: true
    end

    add_index :drones, :serial_number, unique: true
  end

  def self.down
    drop_table :drones
  end
end

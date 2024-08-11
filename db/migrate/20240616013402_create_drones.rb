class CreateDrones < ActiveRecord::Migration[7.1]
  def change
    create_table :drones do |t|
      t.string  :name
      t.string  :description
      t.string  :serial_number
      t.integer :drone_type
      t.float   :battery_capacity
      t.integer :board_type
      t.float   :max_wind_speed

      t.references :user, null: false, foreign_key: true
    end
  end

  def self.down
    drop_table :drones
  end
end

# frozen_string_literal: true

class CreateDeviseToUsers < ActiveRecord::Migration[7.1]
  def self.up
    create_table :users do |t|
      t.string  :username,           null: false
      t.string  :email,              null: false
      t.string  :encrypted_password, null: false
      t.integer :role,               null: false, default: 0
      t.string  :first_name
      t.string  :last_name
    end

    add_index :users, :email,                unique: true
    add_index :users, :username,             unique: true
  end

  def self.down
    drop_table :users
  end
end

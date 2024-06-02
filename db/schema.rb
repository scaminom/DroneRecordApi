# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_05_30_040645) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "drones", force: :cascade do |t|
    t.datetime "fecha_registro"
    t.float "voltaje"
    t.float "corriente"
    t.float "altitud"
    t.float "velocidad"
    t.string "modo_vuelo"
    t.float "latitud"
    t.float "longitud"
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_drones_on_user_id"
  end

  create_table "stations", force: :cascade do |t|
    t.datetime "fecha_registro"
    t.float "corrienteAC"
    t.float "voltajeDC"
    t.float "corrienteDC"
    t.float "consumo_general"
    t.float "consumoTX"
    t.bigint "drone_id", null: false
    t.index ["drone_id"], name: "index_stations_on_drone_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.integer "role", default: 0, null: false
    t.string "nombre"
    t.string "apellido"
    t.string "jti", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["jti"], name: "index_users_on_jti", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  add_foreign_key "drones", "users"
  add_foreign_key "stations", "drones"
end

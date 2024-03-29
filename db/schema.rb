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

ActiveRecord::Schema[7.1].define(version: 2024_02_26_170021) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "items", force: :cascade do |t|
    t.bigint "adminId", null: false
    t.string "name"
    t.string "image"
    t.text "description"
    t.string "city"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "financeFee", precision: 10, scale: 2
    t.decimal "purchaseFee", precision: 10, scale: 2
    t.decimal "totalAmount", precision: 10, scale: 2
    t.integer "duration"
    t.decimal "apr", precision: 5, scale: 2
    t.index ["adminId"], name: "index_items_on_adminId"
  end

  create_table "reservation_items", force: :cascade do |t|
    t.bigint "reservation_id", null: false
    t.bigint "item_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_reservation_items_on_item_id"
    t.index ["reservation_id"], name: "index_reservation_items_on_reservation_id"
  end

  create_table "reservations", force: :cascade do |t|
    t.bigint "customer_id", null: false
    t.date "reserveForUseDate"
    t.string "city"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "item_id", null: false
    t.index ["customer_id"], name: "index_reservations_on_customer_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "firstName"
    t.string "lastName"
    t.string "city"
    t.boolean "admin", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "jti", null: false
    t.string "confirmPassword"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["jti"], name: "index_users_on_jti", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["username"], name: "index_users_on_username"
  end

  add_foreign_key "items", "users", column: "adminId"
  add_foreign_key "reservation_items", "items"
  add_foreign_key "reservation_items", "reservations"
  add_foreign_key "reservations", "items"
  add_foreign_key "reservations", "users", column: "customer_id"
end

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

ActiveRecord::Schema[7.1].define(version: 2024_01_26_060745) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "aircrafts", force: :cascade do |t|
    t.string "name"
    t.string "model"
    t.string "tail_number"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bio_credentials", force: :cascade do |t|
    t.text "bio", default: "", null: false
    t.string "license_number"
    t.text "license_description"
    t.date "license_effective_date"
    t.date "license_expire_date"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_bio_credentials_on_user_id"
  end

  create_table "documents", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "location"
    t.boolean "hide"
    t.boolean "is_instructor"
    t.boolean "is_student"
    t.boolean "is_maintenance"
    t.boolean "is_frontoffice"
    t.boolean "is_dispatcher"
    t.boolean "is_guest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "events", force: :cascade do |t|
    t.string "title"
    t.datetime "start_time"
    t.datetime "end_time"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "aircraft_id", null: false
    t.bigint "instructor_user_id"
    t.index ["aircraft_id"], name: "index_events_on_aircraft_id"
    t.index ["user_id"], name: "index_events_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name", default: "Guest"
    t.string "middle_initial"
    t.string "last_name", default: "User"
    t.date "birthday"
    t.string "address_1"
    t.string "address_2"
    t.string "city"
    t.string "state"
    t.string "zip_code"
    t.string "phone"
    t.string "emergency_contact_name"
    t.string "emergency_contact_number"
    t.boolean "is_admin", default: false, null: false
    t.boolean "is_instructor", default: false, null: false
    t.boolean "is_student", default: false, null: false
    t.boolean "is_maintenance", default: false, null: false
    t.boolean "is_frontoffice", default: false, null: false
    t.boolean "is_guest", default: false, null: false
    t.boolean "is_dispatcher", default: false, null: false
    t.boolean "is_approved", default: false, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "bio_credentials", "users"
  add_foreign_key "events", "aircrafts"
  add_foreign_key "events", "users"
end

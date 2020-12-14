# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_12_13_073527) do

  create_table "genres", force: :cascade do |t|
    t.string "name"
    t.integer "genre_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "shops", force: :cascade do |t|
    t.string "name", null: false
    t.string "name_kana", null: false
    t.integer "prefecture", null: false
    t.string "address", null: false
    t.string "zipcode", null: false
    t.string "phonenumber", null: false
    t.string "hp"
    t.string "regular_holiday", null: false
    t.string "opning_hours", null: false
    t.string "acsess", null: false
    t.string "parking", null: false
    t.string "seats", null: false
    t.integer "payment"
    t.integer "facility"
    t.integer "genre_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "latitude"
    t.float "longitude"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "sex"
    t.date "date_of_birth"
    t.text "introduction"
    t.string "profile_image"
    t.string "profile_image_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end

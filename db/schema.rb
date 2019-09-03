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

ActiveRecord::Schema.define(version: 2019_08_28_182005) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "event_spots", force: :cascade do |t|
    t.bigint "event_id"
    t.bigint "spot_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_event_spots_on_event_id"
    t.index ["spot_id"], name: "index_event_spots_on_spot_id"
  end

  create_table "events", force: :cascade do |t|
    t.string "name"
    t.string "location"
    t.text "description"
    t.date "date"
    t.boolean "completed"
    t.string "alt_spot_1"
    t.string "alt_spot_2"
    t.string "alt_spot_3"
    t.string "alt_spot_4"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "journals", force: :cascade do |t|
    t.bigint "spot_id"
    t.bigint "user_id"
    t.date "date"
    t.integer "flow"
    t.decimal "height"
    t.string "pref_charc"
    t.string "quality"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["spot_id"], name: "index_journals_on_spot_id"
    t.index ["user_id"], name: "index_journals_on_user_id"
  end

  create_table "photos", force: :cascade do |t|
    t.bigint "spot_id"
    t.bigint "user_id"
    t.string "source"
    t.text "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["spot_id"], name: "index_photos_on_spot_id"
    t.index ["user_id"], name: "index_photos_on_user_id"
  end

  create_table "spots", force: :cascade do |t|
    t.string "name"
    t.decimal "lat", precision: 10, scale: 6
    t.decimal "long", precision: 10, scale: 6
    t.string "country"
    t.string "city"
    t.string "state"
    t.string "quality"
    t.string "river"
    t.string "river_section"
    t.string "gauge_url"
    t.string "min_flow"
    t.string "max_flow"
    t.string "ideal_flow"
    t.text "description"
    t.string "water_temp"
    t.string "current_cfs"
    t.string "current_height"
    t.string "gauge_name"
    t.integer "gauge_num"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "region"
  end

  create_table "user_events", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_user_events_on_event_id"
    t.index ["user_id"], name: "index_user_events_on_user_id"
  end

  create_table "user_spots", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "spot_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["spot_id"], name: "index_user_spots_on_spot_id"
    t.index ["user_id"], name: "index_user_spots_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.string "avatar"
    t.string "location"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "event_spots", "events"
  add_foreign_key "event_spots", "spots"
  add_foreign_key "journals", "spots"
  add_foreign_key "journals", "users"
  add_foreign_key "photos", "spots"
  add_foreign_key "photos", "users"
  add_foreign_key "user_events", "events"
  add_foreign_key "user_events", "users"
  add_foreign_key "user_spots", "spots"
  add_foreign_key "user_spots", "users"
end

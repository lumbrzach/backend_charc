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

ActiveRecord::Schema.define(version: 2019_09_10_214112) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

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
    t.boolean "completed", default: false
    t.string "photo_url"
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
    t.string "spot_name"
    t.string "username"
    t.date "date"
    t.string "river_level"
    t.string "pref_charc"
    t.string "quality"
    t.text "explore_notes"
    t.integer "high_water_event"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["spot_id"], name: "index_journals_on_spot_id"
    t.index ["user_id"], name: "index_journals_on_user_id"
  end

  create_table "photos", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "spot_id"
    t.string "source"
    t.text "comment"
    t.string "username"
    t.date "add_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["spot_id"], name: "index_photos_on_spot_id"
    t.index ["user_id"], name: "index_photos_on_user_id"
  end

  create_table "spots", force: :cascade do |t|
    t.string "name"
    t.string "river"
    t.string "river_section"
    t.string "country"
    t.string "region"
    t.string "state"
    t.string "city"
    t.string "gauge_name"
    t.string "min_flow"
    t.string "ideal_flow"
    t.string "max_flow"
    t.decimal "lat", precision: 10, scale: 6
    t.decimal "long", precision: 10, scale: 6
    t.string "gauge_url"
    t.string "prediction_url"
    t.text "description"
    t.string "gauge_num"
    t.string "flow_type"
    t.string "zoom_level"
    t.string "quality"
    t.string "crtd_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
    t.string "email"
    t.string "first_name"
    t.string "last_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "location"
    t.string "avatar"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
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

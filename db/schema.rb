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

ActiveRecord::Schema.define(version: 20161114035545) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "identities", force: :cascade do |t|
    t.integer "user_id"
    t.string  "provider"
    t.string  "uid"
    t.index ["user_id"], name: "index_identities_on_user_id", using: :btree
  end

  create_table "item_reservations", force: :cascade do |t|
    t.integer  "reservation_id"
    t.float    "price"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "quantity",        default: 1
    t.integer  "amount"
    t.string   "reservable_type"
    t.integer  "reservable_id"
    t.index ["reservable_type", "reservable_id"], name: "index_item_reservations_on_reservable_type_and_reservable_id", using: :btree
    t.index ["reservation_id"], name: "index_item_reservations_on_reservation_id", using: :btree
  end

  create_table "landing_images", force: :cascade do |t|
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "url"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "heading"
    t.string   "description"
  end

  create_table "paypal_transactions", force: :cascade do |t|
    t.string   "token"
    t.string   "payer_id"
    t.string   "transaction_id"
    t.integer  "reservation_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["reservation_id"], name: "index_paypal_transactions_on_reservation_id", using: :btree
  end

  create_table "reservations", force: :cascade do |t|
    t.integer  "user_id"
    t.date     "start_date"
    t.date     "end_date"
    t.float    "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_reservations_on_user_id", using: :btree
  end

  create_table "room_images", force: :cascade do |t|
    t.integer  "room_type_id"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.index ["room_type_id"], name: "index_room_images_on_room_type_id", using: :btree
  end

  create_table "room_promotions", force: :cascade do |t|
    t.integer  "room_type_id"
    t.date     "start_date"
    t.date     "end_date"
    t.integer  "percentage"
    t.integer  "amount"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["room_type_id"], name: "index_room_promotions_on_room_type_id", using: :btree
  end

  create_table "room_types", force: :cascade do |t|
    t.string   "name"
    t.float    "price"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "total_room",     default: 0
    t.integer  "remaining_room", default: 0
    t.string   "description"
    t.text     "features",       default: [],              array: true
    t.string   "title"
  end

  create_table "rooms", force: :cascade do |t|
    t.integer  "room_type_id"
    t.string   "number"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["room_type_id"], name: "index_rooms_on_room_type_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.boolean  "is_admin",               default: false
    t.text     "profile_image_url"
    t.string   "name"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "identities", "users"
  add_foreign_key "item_reservations", "reservations"
  add_foreign_key "paypal_transactions", "reservations"
  add_foreign_key "reservations", "users"
  add_foreign_key "room_images", "room_types"
  add_foreign_key "room_promotions", "room_types"
  add_foreign_key "rooms", "room_types"
end

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

ActiveRecord::Schema.define(version: 20170615194835) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
    t.index ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
    t.index ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree
  end

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

  create_table "promotions", force: :cascade do |t|
    t.integer  "percentage_off"
    t.integer  "amount_off"
    t.string   "code"
    t.text     "description"
    t.boolean  "active"
    t.string   "name"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["code"], name: "index_promotions_on_code", unique: true, using: :btree
  end

  create_table "remainings", force: :cascade do |t|
    t.integer  "quantity_left",             null: false
    t.integer  "room_type_id",              null: false
    t.date     "date"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "lock_version",  default: 0, null: false
    t.index ["room_type_id", "date"], name: "index_remainings_on_room_type_id_and_date", unique: true, using: :btree
    t.index ["room_type_id"], name: "index_remainings_on_room_type_id", using: :btree
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

  create_table "review_images", force: :cascade do |t|
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "content"
    t.string   "name"
  end

  create_table "room_images", force: :cascade do |t|
    t.integer  "room_type_id"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.boolean  "primary",            default: false
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
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.integer  "capacity",          default: 0
    t.string   "description"
    t.text     "features",          default: [],                 array: true
    t.string   "title"
    t.string   "slug"
    t.integer  "quantity",          default: 10,    null: false
    t.float    "price",             default: 0.0,   null: false
    t.string   "bed_type"
    t.float    "init_price"
    t.text     "short_description"
    t.integer  "size"
    t.boolean  "favourite",         default: false
    t.datetime "last_book_time"
    t.index ["slug"], name: "index_room_types_on_slug", unique: true, using: :btree
  end

  create_table "rooms", force: :cascade do |t|
    t.integer  "room_type_id"
    t.string   "number"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["room_type_id"], name: "index_rooms_on_room_type_id", using: :btree
  end

  create_table "settings", force: :cascade do |t|
    t.string   "name"
    t.string   "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "taggings", force: :cascade do |t|
    t.integer  "tag_id"
    t.string   "taggable_type"
    t.integer  "taggable_id"
    t.string   "tagger_type"
    t.integer  "tagger_id"
    t.string   "context",       limit: 128
    t.datetime "created_at"
    t.index ["context"], name: "index_taggings_on_context", using: :btree
    t.index ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true, using: :btree
    t.index ["tag_id"], name: "index_taggings_on_tag_id", using: :btree
    t.index ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context", using: :btree
    t.index ["taggable_id", "taggable_type", "tagger_id", "context"], name: "taggings_idy", using: :btree
    t.index ["taggable_id"], name: "index_taggings_on_taggable_id", using: :btree
    t.index ["taggable_type"], name: "index_taggings_on_taggable_type", using: :btree
    t.index ["tagger_id", "tagger_type"], name: "index_taggings_on_tagger_id_and_tagger_type", using: :btree
    t.index ["tagger_id"], name: "index_taggings_on_tagger_id", using: :btree
  end

  create_table "tags", force: :cascade do |t|
    t.string  "name"
    t.integer "taggings_count", default: 0
    t.index ["name"], name: "index_tags_on_name", unique: true, using: :btree
  end

  create_table "tour_images", force: :cascade do |t|
    t.integer  "tour_id"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.boolean  "primary",            default: false
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.text     "description"
    t.index ["tour_id"], name: "index_tour_images_on_tour_id", using: :btree
  end

  create_table "tours", force: :cascade do |t|
    t.string   "name"
    t.string   "start_time"
    t.string   "end_time"
    t.float    "price"
    t.text     "included"
    t.text     "private_tour_pricing", default: [],              array: true
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "short_description"
    t.string   "slug"
    t.integer  "group"
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
  add_foreign_key "remainings", "room_types"
  add_foreign_key "reservations", "users"
  add_foreign_key "room_images", "room_types"
  add_foreign_key "room_promotions", "room_types"
  add_foreign_key "rooms", "room_types"
  add_foreign_key "tour_images", "tours"
end

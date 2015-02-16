ActiveRecord::Schema.define(version: 20150216135759) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "flats", force: :cascade do |t|
    t.integer  "price"
    t.string   "description"
    t.integer  "capacity"
    t.string   "address"
    t.string   "city"
    t.string   "country"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "orders", force: :cascade do |t|
    t.date     "date_begin"
    t.date     "date_end"
    t.boolean  "booked"
    t.integer  "user_id"
    t.integer  "flat_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end

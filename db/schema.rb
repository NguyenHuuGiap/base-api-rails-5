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

ActiveRecord::Schema.define(version: 2018_12_04_042718) do

  create_table "accounts", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "account", null: false
    t.string "password_digest", null: false
    t.string "before_password", null: false
    t.string "init_password", null: false
    t.integer "staff_role", default: 0, null: false
    t.datetime "account_created"
    t.datetime "account_stoped"
    t.integer "account_div", default: 1
    t.integer "log_miss_count", default: 0
    t.integer "account_lock", default: 0
    t.datetime "lockout_time"
    t.datetime "unlocked_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "auth_tokens", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "account_id"
    t.string "token", null: false
    t.datetime "expired_at", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_auth_tokens_on_account_id"
  end

  add_foreign_key "auth_tokens", "accounts"
end

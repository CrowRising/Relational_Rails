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

ActiveRecord::Schema.define(version: 2023_03_21_034417) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "barns", force: :cascade do |t|
    t.string "location"
    t.string "name"
    t.boolean "arena"
    t.boolean "trail_access"
    t.integer "monthly_fee"
    t.integer "stalls"
    t.boolean "vacancy"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "horses", force: :cascade do |t|
    t.string "name"
    t.string "breed"
    t.integer "age"
    t.boolean "trail_user"
    t.boolean "arena_user"
    t.boolean "paid"
    t.bigint "barns_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["barns_id"], name: "index_horses_on_barns_id"
  end

  add_foreign_key "horses", "barns", column: "barns_id"
end

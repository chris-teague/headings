# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20151011002920) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "budget_items", force: :cascade do |t|
    t.date     "date"
    t.integer  "project_id"
    t.integer  "development_metres"
    t.integer  "rehab_metres"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "daily_summaries", force: :cascade do |t|
    t.integer  "project_id"
    t.date     "date"
    t.decimal  "actual_advance_metres",     precision: 15, scale: 4
    t.decimal  "actual_rehab_metres",       precision: 15, scale: 4
    t.decimal  "actual_available_headings", precision: 15, scale: 4
    t.decimal  "daily_advance_metres",      precision: 15, scale: 4
    t.decimal  "daily_rehab_metres",        precision: 15, scale: 4
    t.decimal  "daily_active_headings",     precision: 15, scale: 4
    t.decimal  "daily_available_headings",  precision: 15, scale: 4
    t.datetime "created_at",                                         null: false
    t.datetime "updated_at",                                         null: false
  end

  create_table "headings", force: :cascade do |t|
    t.integer  "project_id"
    t.string   "name"
    t.string   "status"
    t.decimal  "lat",         precision: 15, scale: 10
    t.decimal  "lng",         precision: 15, scale: 10
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
    t.integer  "completion",                            default: 0
    t.string   "parent_name"
  end

  create_table "machines", force: :cascade do |t|
    t.integer  "project_id"
    t.string   "name"
    t.decimal  "lat"
    t.decimal  "lng"
    t.datetime "last_serviced_at"
    t.datetime "next_scheduled_service"
    t.string   "status"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "projects", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",                                            null: false
    t.datetime "updated_at",                                            null: false
    t.string   "url"
    t.decimal  "lat",           precision: 15, scale: 10
    t.decimal  "lng",           precision: 15, scale: 10
    t.text     "description"
    t.string   "owner"
    t.integer  "budget_status",                           default: 100
  end

  create_table "staffs", force: :cascade do |t|
    t.integer  "project_id"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "phone"
    t.string   "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end

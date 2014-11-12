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

ActiveRecord::Schema.define(version: 20141110232133) do

  create_table "account_settings", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "announcements", force: true do |t|
    t.string   "first_line"
    t.string   "second_line"
    t.string   "third_line"
    t.integer  "winner_id"
    t.integer  "random_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contests", force: true do |t|
    t.datetime "end_date"
    t.string   "featured_event"
    t.string   "featured_event_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "events", force: true do |t|
    t.string   "scoring_type"
    t.string   "event_name"
    t.integer  "contest_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "scrambles", force: true do |t|
    t.string   "scramble_string"
    t.integer  "event_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sessions", force: true do |t|
    t.string   "session_id", null: false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], name: "index_sessions_on_session_id", unique: true
  add_index "sessions", ["updated_at"], name: "index_sessions_on_updated_at"

  create_table "submissions", force: true do |t|
    t.integer  "user_id"
    t.integer  "contest_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "event_id"
    t.float    "result"
    t.string   "time_list"
    t.string   "best_time"
  end

  create_table "users", force: true do |t|
    t.string  "first_name"
    t.string  "last_name"
    t.string  "wca_id"
    t.string  "login"
    t.string  "salt"
    t.string  "password_digest"
    t.boolean "isMod",           default: false
    t.boolean "isAdmin",         default: false
    t.string  "email"
    t.integer "ELO_2x2",         default: 800
    t.integer "ELO_3x3",         default: 800
    t.integer "ELO_4x4",         default: 800
    t.integer "ELO_5x5",         default: 800
    t.integer "ELO_6x6",         default: 800
    t.integer "ELO_7x7",         default: 800
    t.integer "ELO_3x3OH",       default: 800
    t.integer "ELO_Megaminx",    default: 800
    t.integer "ELO_Pyraminx",    default: 800
    t.integer "ELO_Square1",     default: 800
    t.integer "ELO_Clock",       default: 800
    t.integer "ELO_Skewb",       default: 800
  end

end

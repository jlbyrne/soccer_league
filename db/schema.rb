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

ActiveRecord::Schema.define(version: 20150127164158) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string   "street_1",              null: false
    t.string   "street_2"
    t.string   "city",                  null: false
    t.string   "state",      limit: 2,  null: false
    t.string   "zip",        limit: 10, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "games", force: :cascade do |t|
    t.date     "date",         null: false
    t.integer  "home_team_id", null: false
    t.integer  "away_team_id", null: false
    t.integer  "home_score"
    t.integer  "away_score"
    t.integer  "winner_id"
    t.integer  "address_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "players", force: :cascade do |t|
    t.integer  "team_id",    null: false
    t.string   "first_name", null: false
    t.string   "last_name",  null: false
    t.date     "birthday",   null: false
    t.integer  "address_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "teams", force: :cascade do |t|
    t.string   "name",                      null: false
    t.string   "mascot"
    t.string   "color"
    t.integer  "players_count", default: 0, null: false
    t.integer  "address_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end

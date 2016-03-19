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

ActiveRecord::Schema.define(version: 20160318195147) do

  create_table "users", id: false, force: :cascade do |t|
    t.string   "uuid",            limit: 36,  null: false
    t.string   "first_name",      limit: 80
    t.string   "last_name",       limit: 80
    t.string   "email",           limit: 255
    t.string   "password_digest", limit: 255
    t.integer  "gender",          limit: 1
    t.integer  "logged_in_using", limit: 2
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "users", ["uuid", "first_name", "last_name"], name: "index_users_on_uuid_and_first_name_and_last_name", using: :btree

end

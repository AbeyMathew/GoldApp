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

ActiveRecord::Schema.define(version: 20140122211255) do

  create_table "gold_value_inquiries", force: true do |t|
    t.decimal  "Purity"
    t.decimal  "Weight"
    t.decimal  "MarketPrice"
    t.decimal  "Value"
    t.integer  "UserId"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "gold_value_inquiries", ["UserId", "created_at"], name: "index_gold_value_inquiries_on_UserId_and_created_at"

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "remember_token"
    t.string   "gold_value_inquiry"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["gold_value_inquiry"], name: "index_users_on_gold_value_inquiry"
  add_index "users", ["remember_token"], name: "index_users_on_remember_token"

  create_table "value_inquiries", force: true do |t|
    t.decimal  "karat"
    t.decimal  "weight"
    t.decimal  "market_price"
    t.decimal  "value"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "value_inquiries", ["user_id", "created_at"], name: "index_value_inquiries_on_user_id_and_created_at"

end

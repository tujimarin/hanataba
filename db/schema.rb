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

ActiveRecord::Schema.define(version: 20150915110622) do

  create_table "cart_items", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "item_id"
    t.integer  "amount"
    t.string   "status"
    t.date     "change_status_date"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "cart_items", ["item_id"], name: "index_cart_items_on_item_id"
  add_index "cart_items", ["user_id"], name: "index_cart_items_on_user_id"

  create_table "items", force: :cascade do |t|
    t.string   "name"
    t.integer  "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text     "comment"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.integer  "postal_code"
    t.string   "address"
    t.string   "credit_card"
    t.integer  "tel"
    t.string   "email"
    t.string   "password"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "change_status_date"
    t.string   "password_digest"
    t.string   "remember_token"
  end

  add_index "users", ["remember_token"], name: "index_users_on_remember_token"

end

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

ActiveRecord::Schema.define(version: 20160130195123) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "consultants", force: true do |t|
    t.string   "name"
    t.string   "nickname"
    t.string   "email"
    t.integer  "outcome",          default: 0,     null: false
    t.string   "outcome_currency", default: "BRL", null: false
    t.integer  "income",           default: 0,     null: false
    t.string   "income_currency",  default: "BRL", null: false
    t.integer  "balance",          default: 0,     null: false
    t.string   "balance_currency", default: "BRL", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "products", force: true do |t|
    t.integer  "code"
    t.string   "name"
    t.integer  "purchase_price",          default: 0,     null: false
    t.string   "purchase_price_currency", default: "BRL", null: false
    t.integer  "sales_price",             default: 0,     null: false
    t.string   "sales_price_currency",    default: "BRL", null: false
    t.integer  "points"
    t.string   "product_type"
    t.integer  "status",                  default: 0
    t.integer  "request_id"
    t.integer  "consultant_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "requests", force: true do |t|
    t.text     "details"
    t.integer  "consultant_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end

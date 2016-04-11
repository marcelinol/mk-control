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

ActiveRecord::Schema.define(version: 20160411044122) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "consultants", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "nickname",   limit: 255
    t.string   "email",      limit: 255
    t.decimal  "outcome",                default: 0.0
    t.decimal  "income",                 default: 0.0
    t.decimal  "balance",                default: 0.0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "customers", force: :cascade do |t|
    t.string   "name",              limit: 255
    t.string   "source",            limit: 255
    t.integer  "status"
    t.datetime "last_contact_date"
    t.string   "email",             limit: 255
    t.text     "observations"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "next_contact_date"
    t.integer  "consultant_id"
    t.string   "cellphone"
    t.string   "phone"
    t.text     "address"
    t.string   "address_link"
  end

  add_index "customers", ["consultant_id"], name: "index_customers_on_consultant_id", using: :btree

  create_table "products", force: :cascade do |t|
    t.integer  "code"
    t.string   "name",           limit: 255
    t.decimal  "purchase_price"
    t.decimal  "sales_price"
    t.integer  "points"
    t.string   "product_type",   limit: 255
    t.integer  "status",                     default: 0
    t.integer  "request_id"
    t.integer  "consultant_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "sale_id"
  end

  add_index "products", ["sale_id"], name: "index_products_on_sale_id", using: :btree

  create_table "requests", force: :cascade do |t|
    t.text     "details"
    t.integer  "consultant_id"
    t.decimal  "cost"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "total_cost",    default: 0.0
  end

  create_table "sales", force: :cascade do |t|
    t.integer  "customer_id"
    t.decimal  "value"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "consultant_id"
  end

  add_index "sales", ["consultant_id"], name: "index_sales_on_consultant_id", using: :btree
  add_index "sales", ["customer_id"], name: "index_sales_on_customer_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                      default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "consultant_id"
  end

  add_index "users", ["consultant_id"], name: "index_users_on_consultant_id", using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end

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

ActiveRecord::Schema.define(version: 20170316192116) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "products", force: :cascade do |t|
    t.string   "name"
    t.string   "image_url"
    t.string   "manufacturer"
    t.string   "model"
    t.string   "term"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["term"], name: "index_products_on_term", using: :btree
  end

  create_table "seller_offers", force: :cascade do |t|
    t.integer  "seller_id"
    t.string   "name"
    t.string   "currency"
    t.string   "url"
    t.decimal  "price",      precision: 8, scale: 2
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.index ["seller_id"], name: "index_seller_offers_on_seller_id", using: :btree
  end

  create_table "sellers", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_sellers_on_name", using: :btree
  end

end

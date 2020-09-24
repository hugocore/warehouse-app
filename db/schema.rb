# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_09_24_120448) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "products", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.datetime "discarded_at"
    t.datetime "created_at", default: "2020-09-24 12:04:24"
    t.datetime "updated_at", default: "2020-09-24 12:04:24"
    t.index ["discarded_at", "title"], name: "index_products_on_discarded_at_and_title"
    t.index ["discarded_at"], name: "index_products_on_discarded_at"
  end

  create_table "variants", force: :cascade do |t|
    t.string "sku"
    t.integer "quantity"
    t.bigint "product_id", null: false
    t.datetime "discarded_at"
    t.datetime "created_at", default: "2020-09-24 12:14:30"
    t.datetime "updated_at", default: "2020-09-24 12:14:30"
    t.index ["discarded_at", "sku"], name: "index_variants_on_discarded_at_and_sku"
    t.index ["discarded_at"], name: "index_variants_on_discarded_at"
    t.index ["product_id"], name: "index_variants_on_product_id"
  end

  add_foreign_key "variants", "products"
end

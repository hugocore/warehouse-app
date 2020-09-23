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

ActiveRecord::Schema.define(version: 2020_09_23_180817) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "products", force: :cascade do |t|
    t.string "title"
    t.string "description"
  end

  create_table "variants", force: :cascade do |t|
    t.string "sku"
    t.integer "quantity"
    t.bigint "product_id", null: false
    t.index ["product_id"], name: "index_variants_on_product_id"
  end

  add_foreign_key "variants", "products"
end

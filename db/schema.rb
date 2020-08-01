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

ActiveRecord::Schema.define(version: 2020_08_01_063225) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "conversions", force: :cascade do |t|
    t.string "name"
    t.integer "quantity"
    t.integer "converted_quant"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "purchase_units"
    t.string "conversion_units"
  end

  create_table "inventories", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.integer "user_id"
    t.string "selling_units"
  end

  create_table "items", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "t_qunatity"
    t.float "cost"
    t.integer "user_id"
    t.string "purchase_units"
  end

  create_table "join_items", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "quantity"
    t.integer "inventory_id"
    t.integer "item_id"
  end

  create_table "merge_tables", force: :cascade do |t|
    t.integer "item_id"
    t.integer "inventory_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "quantity"
  end

  create_table "purchaseitems", force: :cascade do |t|
    t.integer "item_id"
    t.integer "purchase_id"
    t.integer "quantity"
    t.float "cost"
  end

  create_table "purchases", force: :cascade do |t|
    t.string "seller"
    t.integer "p_quantity"
    t.float "cost"
    t.integer "unit"
    t.datetime "created_at"
    t.integer "user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "fname"
    t.string "lname"
    t.string "email"
    t.string "isAdmin"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "password_digest"
  end

end

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_05_13_113012) do
  create_table "items", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.string "description"
    t.integer "quantity"
    t.string "measure"
    t.integer "zone_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["zone_id"], name: "index_items_on_zone_id"
  end

  create_table "sections", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.integer "warehouse_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "description"
    t.index ["warehouse_id"], name: "index_sections_on_warehouse_id"
  end

  create_table "warehouses", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "location"
  end

  create_table "zones", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.integer "section_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "description"
    t.index ["section_id"], name: "index_zones_on_section_id"
  end

  add_foreign_key "items", "zones"
  add_foreign_key "sections", "warehouses"
  add_foreign_key "zones", "sections"
end

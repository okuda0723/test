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

ActiveRecord::Schema.define(version: 2021_09_02_083829) do

  create_table "cookings", charset: "utf8mb3", force: :cascade do |t|
    t.string "title"
    t.date "created_date"
    t.string "image_1"
    t.string "image_2"
    t.string "image_3"
    t.string "comment"
    t.float "rating"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "directions", charset: "utf8mb3", force: :cascade do |t|
    t.bigint "cooking_id", null: false
    t.integer "step_number"
    t.text "text"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["cooking_id"], name: "index_directions_on_cooking_id"
  end

  create_table "ingredients", charset: "utf8mb3", force: :cascade do |t|
    t.bigint "cooking_id", null: false
    t.string "ingredient_name"
    t.string "quantity"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["cooking_id"], name: "index_ingredients_on_cooking_id"
  end

  add_foreign_key "directions", "cookings"
  add_foreign_key "ingredients", "cookings"
end

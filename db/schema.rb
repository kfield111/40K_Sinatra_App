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

ActiveRecord::Schema.define(version: 2020_11_12_021400) do

  create_table "armies", force: :cascade do |t|
    t.string "army_name"
    t.string "faction"
    t.integer "army_point_cost"
    t.integer "user_id"
  end

  create_table "units", force: :cascade do |t|
    t.string "unit_name"
    t.string "faction"
    t.integer "model_count"
    t.integer "user_id"
    t.integer "army_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
  end

end

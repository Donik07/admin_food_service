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

ActiveRecord::Schema[7.0].define(version: 2023_05_08_094001) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.string "company_name"
    t.string "inn"
    t.string "email", default: "", null: false
    t.string "phone"
    t.string "country", null: false
    t.string "city", null: false
    t.boolean "is_partner", default: false
    t.integer "users_count"
    t.integer "points_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "order_stages", force: :cascade do |t|
    t.string "name"
    t.string "color"
    t.integer "position"
    t.bigint "point_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["point_id"], name: "index_order_stages_on_point_id"
  end

  create_table "orders", force: :cascade do |t|
    t.string "title"
    t.text "dishes"
    t.decimal "amount", default: "0.0"
    t.string "customer_name"
    t.string "customer_phone"
    t.string "customer_comment"
    t.bigint "number"
    t.integer "executor_id"
    t.bigint "order_stages_id"
    t.bigint "account_id"
    t.bigint "point_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_orders_on_account_id"
    t.index ["order_stages_id"], name: "index_orders_on_order_stages_id"
    t.index ["point_id"], name: "index_orders_on_point_id"
  end

  create_table "points", force: :cascade do |t|
    t.string "name", null: false
    t.string "address"
    t.integer "orders_count"
    t.integer "users_count"
    t.bigint "account_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_points_on_account_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name", default: ""
    t.string "last_name", default: ""
    t.string "email", default: "", null: false
    t.string "phone", default: ""
    t.string "role", default: "executive"
    t.string "ancestry"
    t.boolean "disabled", default: false
    t.bigint "account_id"
    t.bigint "point_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_users_on_account_id"
    t.index ["point_id"], name: "index_users_on_point_id"
  end

end

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

ActiveRecord::Schema.define(version: 20170618171735) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_categories_on_user_id"
  end

  create_table "categories_expenses", id: false, force: :cascade do |t|
    t.bigint "category_id", null: false
    t.bigint "expense_id", null: false
    t.index ["expense_id", "category_id"], name: "index_categories_expenses_on_expense_id_and_category_id", unique: true
  end

  create_table "categories_smart_expenses", id: false, force: :cascade do |t|
    t.bigint "category_id", null: false
    t.bigint "smart_expense_id", null: false
    t.index ["smart_expense_id", "category_id"], name: "index_categories_smart_expenses", unique: true
  end

  create_table "expenses", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.money "amount", scale: 2, null: false
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_expenses_on_user_id"
  end

  create_table "smart_expenses", force: :cascade do |t|
    t.bigint "user_id"
    t.money "amount", scale: 2
    t.text "description"
    t.string "expression", null: false
    t.index ["user_id"], name: "index_smart_expenses_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "currency", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "categories", "users"
  add_foreign_key "expenses", "users"
  add_foreign_key "smart_expenses", "users"
end

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

ActiveRecord::Schema.define(version: 2018_06_22_010553) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.bigint "tenant_id"
    t.string "name", null: false
    t.string "type", null: false
    t.decimal "opening_balance", precision: 8, scale: 2
    t.decimal "balance", precision: 8, scale: 2
    t.json "data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_accounts_on_name"
    t.index ["tenant_id"], name: "index_accounts_on_tenant_id"
    t.index ["type"], name: "index_accounts_on_type"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.bigint "group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_categories_on_group_id"
    t.index ["name"], name: "index_categories_on_name"
  end

  create_table "category_transactions", force: :cascade do |t|
    t.bigint "category_id"
    t.bigint "transaction_id"
    t.string "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_category_transactions_on_category_id"
    t.index ["transaction_id"], name: "index_category_transactions_on_transaction_id"
  end

  create_table "payees", force: :cascade do |t|
    t.string "name"
    t.json "data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_payees_on_name"
  end

  create_table "tenants", force: :cascade do |t|
    t.string "subdomain"
    t.json "data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["subdomain"], name: "index_tenants_on_subdomain"
  end

  create_table "transactions", force: :cascade do |t|
    t.bigint "account_id"
    t.date "date"
    t.bigint "payee_id"
    t.decimal "amount", precision: 8, scale: 2
    t.string "memo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_transactions_on_account_id"
    t.index ["date"], name: "index_transactions_on_date"
    t.index ["payee_id"], name: "index_transactions_on_payee_id"
  end

  create_table "transfers", force: :cascade do |t|
    t.date "date"
    t.bigint "from_account_id"
    t.bigint "to_account_id"
    t.decimal "amount", precision: 8, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["date"], name: "index_transfers_on_date"
    t.index ["from_account_id"], name: "index_transfers_on_from_account_id"
    t.index ["to_account_id"], name: "index_transfers_on_to_account_id"
  end

  add_foreign_key "accounts", "tenants"
  add_foreign_key "category_transactions", "categories"
  add_foreign_key "category_transactions", "transactions"
  add_foreign_key "transactions", "payees"
end

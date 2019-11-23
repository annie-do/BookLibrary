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

ActiveRecord::Schema.define(version: 2019_05_01_154229) do

  create_table "accounts", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username"
    t.string "avatar"
    t.boolean "admin", default: false
    t.integer "subscription_id"
    t.index ["email"], name: "index_accounts_on_email", unique: true
    t.index ["reset_password_token"], name: "index_accounts_on_reset_password_token", unique: true
    t.index ["subscription_id"], name: "index_accounts_on_subscription_id"
    t.index ["username"], name: "index_accounts_on_username", unique: true
  end

  create_table "accounts_books", id: false, force: :cascade do |t|
    t.integer "account_id", null: false
    t.integer "book_id", null: false
  end

  create_table "books", force: :cascade do |t|
    t.string "title"
    t.string "author"
    t.string "genre"
    t.text "summary"
    t.decimal "price"
    t.string "cover_url"
    t.string "ownership"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "bookstore_id"
    t.integer "account_id"
    t.index ["account_id"], name: "index_books_on_account_id"
    t.index ["bookstore_id"], name: "index_books_on_bookstore_id"
  end

  create_table "bookstores", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "coupon_codes", force: :cascade do |t|
    t.string "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reading_challenges", force: :cascade do |t|
    t.string "book_title"
    t.string "comment"
    t.date "reading_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.float "rating"
    t.text "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "book_id"
    t.index ["book_id"], name: "index_reviews_on_book_id"
  end

  create_table "subscriptions", force: :cascade do |t|
    t.float "price"
    t.datetime "start_date"
    t.datetime "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "account_id"
    t.index ["account_id"], name: "index_subscriptions_on_account_id"
  end

end

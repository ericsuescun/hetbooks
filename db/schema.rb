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

ActiveRecord::Schema.define(version: 2020_08_03_000339) do

  create_table "authors", force: :cascade do |t|
    t.string "name"
    t.string "lastname"
    t.string "university"
    t.string "job_title"
    t.string "company"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "books", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.string "discipline"
    t.string "topic"
    t.string "specialty"
    t.string "specialty2"
    t.decimal "price"
    t.integer "edition"
    t.integer "pub_year"
    t.string "isbn_10"
    t.string "isbn_13"
    t.integer "pages"
    t.string "size"
    t.string "cover"
    t.string "volumes"
    t.text "index"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", force: :cascade do |t|
    t.integer "customer_id"
    t.string "title"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_comments_on_customer_id"
  end

  create_table "customers", force: :cascade do |t|
    t.integer "user_id"
    t.string "fullname"
    t.string "cel"
    t.string "tel"
    t.string "address"
    t.string "city"
    t.string "email"
    t.string "prof_title"
    t.string "specialty"
    t.string "specialty2"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_customers_on_user_id"
  end

  create_table "deals", force: :cascade do |t|
    t.integer "book_id"
    t.string "name"
    t.string "contact"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_deals_on_book_id"
  end

  create_table "pictures", force: :cascade do |t|
    t.integer "book_id"
    t.string "image"
    t.string "title"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_pictures_on_book_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "lastname"
    t.string "cel"
    t.string "tel"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end

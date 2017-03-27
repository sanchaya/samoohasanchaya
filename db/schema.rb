# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20170327175020) do

  create_table "author_translations", force: true do |t|
    t.integer  "user_id"
    t.integer  "language_id"
    t.integer  "author_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "authors", force: true do |t|
    t.string   "name"
    t.integer  "language_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "book_categories", force: true do |t|
    t.integer  "book_id"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "book_descriptions", force: true do |t|
    t.string   "date_accessioned"
    t.string   "date_available"
    t.string   "date_issued"
    t.string   "link"
    t.string   "rights"
    t.string   "subjects"
    t.string   "file_name"
    t.string   "file_size"
    t.string   "category"
    t.integer  "book_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "others",           limit: 2147483647
  end

  create_table "book_reviews", force: true do |t|
    t.integer  "book_id"
    t.boolean  "reviewed"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "book_translations", force: true do |t|
    t.integer  "language_id"
    t.integer  "book_id"
    t.string   "book_title"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "reviewed"
  end

  create_table "books", force: true do |t|
    t.integer  "author_id"
    t.string   "book_title"
    t.integer  "publisher_id"
    t.integer  "language_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories", force: true do |t|
    t.text     "name"
    t.text     "kn"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "dli_author_translations", force: true do |t|
    t.integer  "user_id"
    t.integer  "language_id"
    t.integer  "author_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "dli_authors", force: true do |t|
    t.string   "name"
    t.integer  "language_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "dli_book_categories", force: true do |t|
    t.integer  "dli_book_id"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "dli_book_descriptions", force: true do |t|
    t.integer  "book_id"
    t.string   "contributor"
    t.string   "scanning_center"
    t.string   "barcode"
    t.string   "copyright"
    t.string   "rights"
    t.integer  "year"
    t.integer  "pages"
    t.string   "url"
    t.integer  "no_of_pages"
    t.string   "vendor"
    t.string   "subject"
    t.date     "digital_pub_date"
    t.string   "link"
    t.integer  "unnumber_pages"
    t.string   "identifier"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "others",           limit: 2147483647
  end

  add_index "dli_book_descriptions", ["book_id"], name: "index_dli_book_descriptions_on_book_id", using: :btree

  create_table "dli_book_reviews", force: true do |t|
    t.integer  "dli_book_id"
    t.boolean  "reviewed"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "dli_book_translations", force: true do |t|
    t.integer  "language_id"
    t.integer  "book_id"
    t.string   "book_title"
    t.integer  "user_id"
    t.boolean  "reviewed",    default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "dli_books", force: true do |t|
    t.integer  "author_id"
    t.string   "book_title"
    t.integer  "publisher_id"
    t.integer  "language_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "dli_publisher_translations", force: true do |t|
    t.integer  "user_id"
    t.integer  "language_id"
    t.integer  "publisher_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "dli_publishers", force: true do |t|
    t.string   "name"
    t.integer  "language_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "fuel_modules", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "fuel_modules", ["name"], name: "index_fuel_modules_on_name", using: :btree

  create_table "fuel_translations", force: true do |t|
    t.integer  "language_id"
    t.integer  "user_id"
    t.integer  "fuel_word_id"
    t.string   "name"
    t.text     "context"
    t.integer  "vote"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "fuel_translations", ["name"], name: "index_fuel_translations_on_name", using: :btree

  create_table "fuel_words", force: true do |t|
    t.integer  "language_id"
    t.integer  "fuel_module_id"
    t.string   "name"
    t.text     "context"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "fuel_words", ["name"], name: "index_fuel_words_on_name", using: :btree

  create_table "kanaja_books", force: true do |t|
    t.string   "uri"
    t.string   "title"
    t.string   "author"
    t.date     "avail_date"
    t.date     "digi_pub_date"
    t.date     "citation_date"
    t.text     "description"
    t.integer  "pages"
    t.string   "language"
    t.string   "publisher"
    t.string   "rights"
    t.string   "classification"
    t.string   "keywords"
    t.string   "en_title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "kannada_books", force: true do |t|
    t.string   "name"
    t.string   "author"
    t.string   "publisher"
    t.string   "library"
    t.string   "book_link"
    t.integer  "book_id"
    t.string   "barcode"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "reviewed",       default: false
    t.text     "rights"
    t.text     "archive_url"
    t.text     "wikimedia_url"
    t.text     "wikisource_url"
  end

  create_table "languages", force: true do |t|
    t.string   "name"
    t.string   "language_code"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "master_books", id: false, force: true do |t|
    t.string "name"
    t.string "author"
    t.string "publisher"
    t.string "library",   limit: 7,          default: "", null: false
    t.string "year"
    t.string "link"
    t.text   "metadata",  limit: 2147483647
  end

  create_table "publisher_translations", force: true do |t|
    t.integer  "user_id"
    t.integer  "language_id"
    t.integer  "publisher_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "publishers", force: true do |t|
    t.string   "name"
    t.integer  "language_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "vote_translations", force: true do |t|
    t.integer  "user_id"
    t.integer  "fuel_translation_id"
    t.integer  "fuel_word_id"
    t.boolean  "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "wiki_books", force: true do |t|
    t.string   "book_name"
    t.string   "library"
    t.integer  "book_id"
    t.boolean  "book_present"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "wiki_users", force: true do |t|
    t.boolean  "is_account"
    t.string   "book_name"
    t.string   "user_name"
    t.boolean  "was_present"
    t.boolean  "is_present"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "book_id"
    t.string   "library"
  end

  add_index "wiki_users", ["book_id"], name: "index_wiki_users_on_book_id", using: :btree

  create_table "world_heritage_site_translations", force: true do |t|
    t.integer  "world_heritage_sites_id"
    t.text     "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "world_heritage_sites", force: true do |t|
    t.integer  "unique_number"
    t.integer  "id_no"
    t.text     "name"
    t.text     "short_description_en", limit: 2147483647
    t.text     "justification_en",     limit: 2147483647
    t.decimal  "longitude",                               precision: 10, scale: 0
    t.decimal  "latitude",                                precision: 10, scale: 0
    t.string   "category"
    t.string   "states_name_en"
    t.text     "name_en"
    t.string   "iso_code"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end

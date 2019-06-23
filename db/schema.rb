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

ActiveRecord::Schema.define(version: 20190604191618) do

  create_table "author_translations", force: :cascade do |t|
    t.integer  "user_id",     limit: 4
    t.integer  "language_id", limit: 4
    t.integer  "author_id",   limit: 4
    t.string   "name",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "authors", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.integer  "language_id", limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "book_categories", force: :cascade do |t|
    t.integer  "book_id",     limit: 4
    t.integer  "category_id", limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "book_descriptions", force: :cascade do |t|
    t.string   "date_accessioned", limit: 255
    t.string   "date_available",   limit: 255
    t.string   "date_issued",      limit: 255
    t.string   "link",             limit: 255
    t.string   "rights",           limit: 255
    t.string   "subjects",         limit: 255
    t.string   "file_name",        limit: 255
    t.string   "file_size",        limit: 255
    t.string   "category",         limit: 255
    t.integer  "book_id",          limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "others",           limit: 4294967295
  end

  create_table "book_reviews", force: :cascade do |t|
    t.integer  "book_id",    limit: 4
    t.boolean  "reviewed"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "book_translations", force: :cascade do |t|
    t.integer  "language_id", limit: 4
    t.integer  "book_id",     limit: 4
    t.string   "book_title",  limit: 255
    t.integer  "user_id",     limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "reviewed"
  end

  create_table "books", force: :cascade do |t|
    t.integer  "author_id",    limit: 4
    t.string   "book_title",   limit: 255
    t.integer  "publisher_id", limit: 4
    t.integer  "language_id",  limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories", force: :cascade do |t|
    t.text     "name",       limit: 65535
    t.text     "kn",         limit: 65535
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "dli_author_translations", force: :cascade do |t|
    t.integer  "user_id",     limit: 4
    t.integer  "language_id", limit: 4
    t.integer  "author_id",   limit: 4
    t.string   "name",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "dli_authors", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.integer  "language_id", limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "dli_book_categories", force: :cascade do |t|
    t.integer  "dli_book_id", limit: 4
    t.integer  "category_id", limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "dli_book_descriptions", force: :cascade do |t|
    t.integer  "book_id",          limit: 4
    t.string   "contributor",      limit: 255
    t.string   "scanning_center",  limit: 255
    t.string   "barcode",          limit: 255
    t.string   "copyright",        limit: 255
    t.string   "rights",           limit: 255
    t.integer  "year",             limit: 4
    t.integer  "pages",            limit: 4
    t.string   "url",              limit: 255
    t.integer  "no_of_pages",      limit: 4
    t.string   "vendor",           limit: 255
    t.string   "subject",          limit: 255
    t.date     "digital_pub_date"
    t.string   "link",             limit: 255
    t.integer  "unnumber_pages",   limit: 4
    t.string   "identifier",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "others",           limit: 4294967295
  end

  add_index "dli_book_descriptions", ["book_id"], name: "index_dli_book_descriptions_on_book_id", using: :btree

  create_table "dli_book_reviews", force: :cascade do |t|
    t.integer  "dli_book_id", limit: 4
    t.boolean  "reviewed"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "dli_book_translations", force: :cascade do |t|
    t.integer  "language_id", limit: 4
    t.integer  "book_id",     limit: 4
    t.string   "book_title",  limit: 255
    t.integer  "user_id",     limit: 4
    t.boolean  "reviewed",                default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "dli_books", force: :cascade do |t|
    t.integer  "author_id",    limit: 4
    t.string   "book_title",   limit: 255
    t.integer  "publisher_id", limit: 4
    t.integer  "language_id",  limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "dli_publisher_translations", force: :cascade do |t|
    t.integer  "user_id",      limit: 4
    t.integer  "language_id",  limit: 4
    t.integer  "publisher_id", limit: 4
    t.string   "name",         limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "dli_publishers", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.integer  "language_id", limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "fuel_modules", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "fuel_modules", ["name"], name: "index_fuel_modules_on_name", using: :btree

  create_table "fuel_translations", force: :cascade do |t|
    t.integer  "language_id",  limit: 4
    t.integer  "user_id",      limit: 4
    t.integer  "fuel_word_id", limit: 4
    t.string   "name",         limit: 255
    t.text     "context",      limit: 65535
    t.integer  "vote",         limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "fuel_translations", ["name"], name: "index_fuel_translations_on_name", using: :btree

  create_table "fuel_words", force: :cascade do |t|
    t.integer  "language_id",    limit: 4
    t.integer  "fuel_module_id", limit: 4
    t.string   "name",           limit: 255
    t.text     "context",        limit: 65535
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "fuel_words", ["name"], name: "index_fuel_words_on_name", using: :btree

  create_table "kanaja_books", force: :cascade do |t|
    t.string   "uri",            limit: 255
    t.string   "title",          limit: 255
    t.string   "author",         limit: 255
    t.date     "avail_date"
    t.date     "digi_pub_date"
    t.date     "citation_date"
    t.text     "description",    limit: 65535
    t.integer  "pages",          limit: 4
    t.string   "language",       limit: 255
    t.string   "publisher",      limit: 255
    t.string   "rights",         limit: 255
    t.string   "classification", limit: 255
    t.string   "keywords",       limit: 255
    t.string   "en_title",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "kannada_book_categories", force: :cascade do |t|
    t.integer  "kannada_book_id", limit: 4
    t.integer  "category_id",     limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "kannada_books", force: :cascade do |t|
    t.string   "name",           limit: 255
    t.string   "author",         limit: 255
    t.string   "publisher",      limit: 255
    t.string   "library",        limit: 255
    t.string   "book_link",      limit: 255
    t.integer  "book_id",        limit: 4
    t.string   "barcode",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "reviewed",                     default: false
    t.text     "rights",         limit: 65535
    t.text     "archive_url",    limit: 65535
    t.text     "wikimedia_url",  limit: 65535
    t.text     "wikisource_url", limit: 65535
    t.string   "year",           limit: 255
  end

  create_table "languages", force: :cascade do |t|
    t.string   "name",          limit: 255
    t.string   "language_code", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "master_books", id: false, force: :cascade do |t|
    t.string "name",      limit: 255
    t.string "author",    limit: 255
    t.string "publisher", limit: 255
    t.string "library",   limit: 7,          default: "", null: false
    t.string "year",      limit: 255
    t.string "link",      limit: 255
    t.text   "metadata",  limit: 4294967295
  end

  create_table "publisher_translations", force: :cascade do |t|
    t.integer  "user_id",      limit: 4
    t.integer  "language_id",  limit: 4
    t.integer  "publisher_id", limit: 4
    t.string   "name",         limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "publishers", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.integer  "language_id", limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.string   "name",                   limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "confirmation_token",     limit: 255
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email",      limit: 255
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "vote_translations", force: :cascade do |t|
    t.integer  "user_id",             limit: 4
    t.integer  "fuel_translation_id", limit: 4
    t.integer  "fuel_word_id",        limit: 4
    t.boolean  "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "wiki_books", force: :cascade do |t|
    t.string   "book_name",    limit: 255
    t.string   "library",      limit: 255
    t.integer  "book_id",      limit: 4
    t.boolean  "book_present"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "wiki_users", force: :cascade do |t|
    t.boolean  "is_account"
    t.string   "book_name",   limit: 255
    t.string   "user_name",   limit: 255
    t.boolean  "was_present"
    t.boolean  "is_present"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "book_id",     limit: 4
    t.string   "library",     limit: 255
  end

  add_index "wiki_users", ["book_id"], name: "index_wiki_users_on_book_id", using: :btree

  create_table "world_heritage_site_translations", force: :cascade do |t|
    t.integer  "world_heritage_sites_id", limit: 4
    t.text     "name",                    limit: 65535
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "world_heritage_sites", force: :cascade do |t|
    t.integer  "unique_number",        limit: 4
    t.integer  "id_no",                limit: 4
    t.text     "name",                 limit: 65535
    t.text     "short_description_en", limit: 4294967295
    t.text     "justification_en",     limit: 4294967295
    t.decimal  "longitude",                               precision: 10
    t.decimal  "latitude",                                precision: 10
    t.string   "category",             limit: 255
    t.string   "states_name_en",       limit: 255
    t.text     "name_en",              limit: 65535
    t.string   "iso_code",             limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end

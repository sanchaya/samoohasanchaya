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

ActiveRecord::Schema.define(version: 20141209192244) do

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
  end

  create_table "book_translations", force: true do |t|
    t.integer  "language_id"
    t.integer  "book_id"
    t.string   "author"
    t.string   "book_title"
    t.string   "publisher"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "books", force: true do |t|
    t.string   "author"
    t.string   "book_title"
    t.string   "publisher"
    t.integer  "language_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "languages", force: true do |t|
    t.string   "name"
    t.string   "language_code"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end

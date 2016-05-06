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

ActiveRecord::Schema.define(version: 20160505151833) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "appointments", force: :cascade do |t|
    t.datetime "start_time", null: false
    t.integer  "length",     null: false
    t.text     "notes"
    t.integer  "phase",      null: false
    t.integer  "mentor_id",  null: false
    t.integer  "student_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "appointments_topics", force: :cascade do |t|
    t.integer "topic_id"
    t.integer "appointment_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer  "author_id"
    t.integer  "rating",         null: false
    t.text     "body",           null: false
    t.integer  "appointment_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "topics", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "topics_users", force: :cascade do |t|
    t.integer "topic_id"
    t.integer "mentor_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "full_name",                           null: false
    t.string   "email",                               null: false
    t.string   "password_digest",                     null: false
    t.string   "photo_path"
    t.string   "phone_number"
    t.string   "type",            default: "Student"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

end

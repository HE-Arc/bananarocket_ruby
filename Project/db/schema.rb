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

ActiveRecord::Schema.define(version: 20160416114732) do

  create_table "image_stages", force: :cascade do |t|
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "image_file_name",    limit: 255
    t.string   "image_content_type", limit: 255
    t.integer  "image_file_size",    limit: 4
    t.datetime "image_updated_at"
    t.integer  "stage_id",           limit: 4
  end

  add_index "image_stages", ["stage_id"], name: "index_image_stages_on_stage_id", using: :btree

  create_table "stage_comments", force: :cascade do |t|
    t.text     "content",    limit: 65535
    t.integer  "nb_update",  limit: 4
    t.integer  "user_id",    limit: 4
    t.integer  "stage_id",   limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "stage_comments", ["stage_id"], name: "index_stage_comments_on_stage_id", using: :btree
  add_index "stage_comments", ["user_id"], name: "index_stage_comments_on_user_id", using: :btree

  create_table "stages", force: :cascade do |t|
    t.string   "title",              limit: 255
    t.text     "description",        limit: 65535
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.string   "adress",             limit: 255
    t.datetime "date_time"
    t.integer  "trip_id",            limit: 4
    t.string   "image_file_name",    limit: 255
    t.string   "image_content_type", limit: 255
    t.integer  "image_file_size",    limit: 4
    t.datetime "image_updated_at"
    t.integer  "stagetype_id",       limit: 4
    t.integer  "score",              limit: 4
  end

  add_index "stages", ["stagetype_id"], name: "index_stages_on_stagetype_id", using: :btree
  add_index "stages", ["trip_id"], name: "index_stages_on_trip_id", using: :btree

  create_table "stagetypes", force: :cascade do |t|
    t.string   "title",      limit: 255
    t.string   "icon",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "trips", force: :cascade do |t|
    t.string   "title",              limit: 255
    t.text     "description",        limit: 65535
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.integer  "user_id",            limit: 4
    t.datetime "date_start"
    t.datetime "date_end"
    t.string   "main_country",       limit: 255
    t.string   "image_file_name",    limit: 255
    t.string   "image_content_type", limit: 255
    t.integer  "image_file_size",    limit: 4
    t.datetime "image_updated_at"
  end

  add_index "trips", ["user_id"], name: "index_trips_on_user_id", using: :btree

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
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.string   "username",               limit: 255
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "image_stages", "stages"
  add_foreign_key "stage_comments", "stages"
  add_foreign_key "stage_comments", "users"
  add_foreign_key "stages", "stagetypes"
  add_foreign_key "stages", "trips"
  add_foreign_key "trips", "users"
end

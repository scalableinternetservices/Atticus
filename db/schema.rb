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

ActiveRecord::Schema.define(version: 20150520204353) do

  create_table "comments", force: :cascade do |t|
    t.text     "message",     limit: 65535
    t.integer  "contract_id", limit: 4
    t.integer  "parent_id",   limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "comments", ["contract_id"], name: "index_comments_on_contract_id", using: :btree
  add_index "comments", ["parent_id"], name: "index_comments_on_parent_id", using: :btree

  create_table "contracts", force: :cascade do |t|
    t.string   "title",                limit: 255
    t.string   "company",              limit: 255
    t.string   "description",          limit: 255
    t.string   "image_url",            limit: 255
    t.decimal  "pay",                              precision: 10
    t.boolean  "progress",             limit: 1,                  default: false
    t.boolean  "done",                 limit: 1,                  default: false
    t.integer  "owner",                limit: 4
    t.integer  "worker",               limit: 4
    t.datetime "created_at",                                                      null: false
    t.datetime "updated_at",                                                      null: false
    t.string   "picture_file_name",    limit: 255
    t.string   "picture_content_type", limit: 255
    t.integer  "picture_file_size",    limit: 4
    t.datetime "picture_updated_at"
  end

  create_table "contracts_skill_tags", id: false, force: :cascade do |t|
    t.integer "contract_id",  limit: 4, null: false
    t.integer "skill_tag_id", limit: 4, null: false
  end

  create_table "contracts_users", id: false, force: :cascade do |t|
    t.integer "user_id",     limit: 4
    t.integer "contract_id", limit: 4
  end

  add_index "contracts_users", ["contract_id"], name: "index_contracts_users_on_contract_id", using: :btree
  add_index "contracts_users", ["user_id"], name: "index_contracts_users_on_user_id", using: :btree

  create_table "industry_tags", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "industry_tags_users", id: false, force: :cascade do |t|
    t.integer "industry_tag_id", limit: 4, null: false
    t.integer "user_id",         limit: 4, null: false
  end

  create_table "skill_tags", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "skill_tags_users", id: false, force: :cascade do |t|
    t.integer "skill_tag_id", limit: 4, null: false
    t.integer "user_id",      limit: 4, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "",   null: false
    t.string   "encrypted_password",     limit: 255, default: "",   null: false
    t.boolean  "is_student",             limit: 1,   default: true
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,    null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.string   "linkedin_url",           limit: 255
    t.string   "github_url",             limit: 255
    t.string   "personal_website",       limit: 255
    t.string   "company_website",        limit: 255
    t.float    "rating_value",           limit: 24
    t.integer  "rating_count",           limit: 4,   default: 0,    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name",             limit: 255
    t.string   "last_name",              limit: 255
    t.string   "corporation",            limit: 255
    t.string   "school",                 limit: 255
    t.string   "image_url",              limit: 255
    t.string   "profile",                limit: 255
    t.string   "avatar_file_name",       limit: 255
    t.string   "avatar_content_type",    limit: 255
    t.integer  "avatar_file_size",       limit: 4
    t.datetime "avatar_updated_at"
  end

  add_foreign_key "comments", "contracts"
end

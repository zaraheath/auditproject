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

ActiveRecord::Schema.define(version: 20131006095009) do

  create_table "audits", force: true do |t|
    t.string   "name",                              null: false
    t.string   "client"
    t.string   "auditor_name"
    t.integer  "user_id",                           null: false
    t.date     "start_date"
    t.date     "end_date"
    t.date     "delivery_date"
    t.text     "objective"
    t.text     "global_opinion"
    t.text     "global_recommendation"
    t.text     "confidential"
    t.text     "limitations"
    t.text     "methodology"
    t.string   "signature"
    t.integer  "sections_count",        default: 0, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "audits", ["user_id"], name: "audits_user_id_fk", using: :btree

  create_table "controls", force: true do |t|
    t.string   "code",            limit: 20
    t.string   "name",                                   null: false
    t.text     "description"
    t.integer  "grade_id"
    t.text     "result",                                 null: false
    t.text     "recommendation"
    t.integer  "section_id"
    t.integer  "questions_count",            default: 0, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "ancestry"
  end

  add_index "controls", ["ancestry"], name: "index_controls_on_ancestry", using: :btree
  add_index "controls", ["section_id"], name: "controls_section_id_fk", using: :btree

  create_table "questions", force: true do |t|
    t.integer  "control_id"
    t.string   "name"
    t.string   "description"
    t.integer  "answer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "questions", ["control_id"], name: "questions_control_id_fk", using: :btree

  create_table "sections", force: true do |t|
    t.string   "name",                       null: false
    t.text     "description"
    t.integer  "controls_count", default: 0, null: false
    t.integer  "audit_id",                   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sections", ["audit_id"], name: "sections_audit_id_fk", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "audits", "users", name: "audits_user_id_fk"

  add_foreign_key "controls", "sections", name: "controls_section_id_fk"

  add_foreign_key "questions", "controls", name: "questions_control_id_fk"

  add_foreign_key "sections", "audits", name: "sections_audit_id_fk"

end

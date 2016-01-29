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

ActiveRecord::Schema.define(version: 20160129190058) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "equations", force: :cascade do |t|
    t.string   "equ",        null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "experiments", force: :cascade do |t|
    t.string   "exp",        null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "gases", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "results", force: :cascade do |t|
    t.string   "res",                        null: false
    t.string   "name",                       null: false
    t.string   "time",                       null: false
    t.json     "standard_data", default: {}, null: false
    t.json     "scalar_data",   default: {}, null: false
    t.json     "vector_data",   default: {}, null: false
    t.integer  "type_id",                    null: false
    t.integer  "equation_id"
    t.integer  "experiment_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "gas_id",                     null: false
  end

  add_index "results", ["equation_id"], name: "index_results_on_equation_id", using: :btree
  add_index "results", ["experiment_id"], name: "index_results_on_experiment_id", using: :btree
  add_index "results", ["gas_id"], name: "index_results_on_gas_id", using: :btree
  add_index "results", ["name", "time"], name: "index_results_on_name_and_time", unique: true, using: :btree
  add_index "results", ["type_id"], name: "index_results_on_type_id", using: :btree

  create_table "types", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "name"
    t.integer  "role"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end

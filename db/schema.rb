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

ActiveRecord::Schema.define(version: 20161105143148) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "app_store_referrals", force: :cascade do |t|
    t.string   "path"
    t.string   "params"
    t.string   "referrer_user_id"
    t.string   "device_id"
    t.integer  "referred_by_app_id"
    t.integer  "application_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.index ["application_id"], name: "index_app_store_referrals_on_application_id", using: :btree
    t.index ["referred_by_app_id"], name: "index_app_store_referrals_on_referred_by_app_id", using: :btree
  end

  create_table "applications", force: :cascade do |t|
    t.string   "title"
    t.string   "app_id"
    t.string   "app_store_id"
    t.string   "play_store_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

end

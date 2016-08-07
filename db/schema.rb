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

ActiveRecord::Schema.define(version: 20160807135405) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "a_tags", force: :cascade do |t|
    t.string   "text"
    t.string   "value"
    t.integer  "link_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["link_id"], name: "index_a_tags_on_link_id", using: :btree
  end

  create_table "h1_tags", force: :cascade do |t|
    t.string   "content"
    t.integer  "link_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["link_id"], name: "index_h1_tags_on_link_id", using: :btree
  end

  create_table "h2_tags", force: :cascade do |t|
    t.string   "content"
    t.integer  "link_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["link_id"], name: "index_h2_tags_on_link_id", using: :btree
  end

  create_table "h3_tags", force: :cascade do |t|
    t.string   "content"
    t.integer  "link_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["link_id"], name: "index_h3_tags_on_link_id", using: :btree
  end

  create_table "links", force: :cascade do |t|
    t.string   "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["url"], name: "index_links_on_url", using: :btree
  end

end

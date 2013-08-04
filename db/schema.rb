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

ActiveRecord::Schema.define(version: 20130802224226) do

  create_table "cuisines", force: true do |t|
    t.integer  "restaurant_id"
    t.boolean  "european"
    t.boolean  "chinese"
    t.boolean  "author"
    t.boolean  "azerbaijanian"
    t.boolean  "armenian"
    t.boolean  "vietnam"
    t.boolean  "thai"
    t.boolean  "indian"
    t.boolean  "indonesian"
    t.boolean  "japan"
    t.boolean  "international"
    t.boolean  "mexican"
    t.boolean  "uzbekian"
    t.boolean  "germanian"
    t.boolean  "american"
    t.boolean  "french"
    t.boolean  "italian"
    t.boolean  "mediterranian"
    t.boolean  "ukrainian"
    t.boolean  "czech"
    t.boolean  "turkish"
    t.boolean  "georgian"
    t.boolean  "arab"
    t.boolean  "korean"
    t.boolean  "panazian"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "cuisines", ["restaurant_id"], name: "index_cuisines_on_restaurant_id", unique: true

  create_table "restaurant_types", force: true do |t|
    t.integer  "restaurant_id"
    t.boolean  "bar"
    t.boolean  "pub"
    t.boolean  "pizza"
    t.boolean  "barbeque"
    t.boolean  "cafe"
    t.boolean  "steakhouse"
    t.boolean  "sushi_bar"
    t.boolean  "vegan_menu"
    t.boolean  "food_court"
    t.boolean  "art_cafe"
    t.boolean  "grand_cafe"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "restaurant_types", ["restaurant_id"], name: "index_restaurant_types_on_restaurant_id", unique: true

  create_table "restaurants", force: true do |t|
    t.string   "name"
    t.string   "address"
    t.string   "metro"
    t.string   "tel"
    t.string   "workhours"
    t.string   "email"
    t.boolean  "delivery"
    t.boolean  "parking"
    t.boolean  "wifi"
    t.integer  "average_paybill"
    t.integer  "max_guests"
    t.integer  "halls_number"
    t.integer  "user_id"
    t.text     "about"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "restaurants", ["user_id"], name: "index_restaurants_on_user_id", unique: true

  create_table "user_types", force: true do |t|
    t.integer  "user_id"
    t.boolean  "emcee"
    t.boolean  "dj"
    t.boolean  "bartender"
    t.boolean  "illusionist"
    t.boolean  "tamada"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_types", ["user_id"], name: "index_user_types_on_user_id", unique: true

  create_table "users", force: true do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.string   "email"
    t.string   "avatar"
    t.string   "city"
    t.string   "country"
    t.string   "password_digest"
    t.string   "skype"
    t.string   "vkontakte"
    t.string   "odkl"
    t.string   "twitter"
    t.text     "languages"
    t.boolean  "guest"
    t.boolean  "restaurant"
    t.boolean  "showman"
    t.boolean  "admin",             default: false
    t.boolean  "banned",            default: false
    t.text     "about"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "unconfirmed_email", default: "f"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true

end

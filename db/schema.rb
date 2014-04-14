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

ActiveRecord::Schema.define(version: 20140411183003) do

  create_table "albums", force: true do |t|
    t.integer  "user_id"
    t.integer  "cover_id"
    t.string   "album_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "albums", ["user_id", "id"], name: "index_albums_on_user_id_and_id"

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

  create_table "images", force: true do |t|
    t.integer  "album_id"
    t.string   "comment"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "images", ["album_id"], name: "index_images_on_album_id"

  create_table "messages", force: true do |t|
    t.string   "sender"
    t.string   "recipient"
    t.string   "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "messages", ["recipient"], name: "index_messages_on_recipient"
  add_index "messages", ["sender", "recipient"], name: "index_messages_on_sender_and_recipient"
  add_index "messages", ["sender"], name: "index_messages_on_sender"

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
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "restaurant_types", ["restaurant_id"], name: "index_restaurant_types_on_restaurant_id", unique: true

  create_table "restaurants", force: true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.string   "address"
    t.string   "metro"
    t.string   "workhours"
    t.boolean  "delivery"
    t.boolean  "parking"
    t.boolean  "wifi"
    t.integer  "average_paybill"
    t.integer  "max_guests"
    t.integer  "halls_number"
    t.text     "about"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "restaurants", ["user_id"], name: "index_restaurants_on_user_id", unique: true

  create_table "showman_types", force: true do |t|
    t.integer  "user_id"
    t.boolean  "emcee"
    t.boolean  "dj"
    t.boolean  "bartender"
    t.boolean  "illusionist"
    t.boolean  "tamada"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "showman_types", ["user_id"], name: "index_showman_types_on_user_id", unique: true

  create_table "users", force: true do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "city"
    t.string   "country"
    t.string   "password_digest"
    t.string   "skype"
    t.string   "vkontakte"
    t.string   "odkl"
    t.string   "twitter"
    t.string   "usr_type"
    t.string   "phone"
    t.date     "birthdate"
    t.boolean  "admin",                  default: false
    t.boolean  "banned",                 default: false
    t.boolean  "completed",              default: false
    t.text     "about"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "unconfirmed_email",      default: "f"
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "authentication_token"
  end

  add_index "users", ["authentication_token"], name: "index_users_on_authentication_token", unique: true
  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end

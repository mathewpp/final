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

ActiveRecord::Schema.define(version: 0) do

  create_table "direct_messages", force: :cascade do |t|
    t.integer  "sender_id"
    t.integer  "receiver_id"
    t.datetime "create_time"
    t.text     "message"
  end

  add_index "direct_messages", ["receiver_id"], name: "index_direct_messages_on_receiver_id"
  add_index "direct_messages", ["sender_id"], name: "index_direct_messages_on_sender_id"

  create_table "favorites", force: :cascade do |t|
    t.integer "user_id"
    t.integer "tweet_id"
  end

  add_index "favorites", ["tweet_id"], name: "index_favorites_on_tweet_id"
  add_index "favorites", ["user_id"], name: "index_favorites_on_user_id"

  create_table "follows", force: :cascade do |t|
    t.integer "followed", default: 0
    t.integer "follower", default: 0
  end

  create_table "list_infos", force: :cascade do |t|
    t.integer "list_id"
    t.integer "user_id"
  end

  add_index "list_infos", ["list_id"], name: "index_list_infos_on_list_id"
  add_index "list_infos", ["user_id"], name: "index_list_infos_on_user_id"

  create_table "lists", force: :cascade do |t|
    t.integer "user_id"
    t.string  "list_name"
    t.string  "description"
  end

  add_index "lists", ["user_id"], name: "index_lists_on_user_id"

  create_table "notifications", force: :cascade do |t|
    t.string   "message"
    t.string   "create_user"
    t.datetime "create_time"
    t.datetime "expiry_time"
  end

  create_table "replies", force: :cascade do |t|
    t.datetime "create_time"
    t.text     "message"
    t.integer  "user_id"
    t.integer  "tweet_id"
  end

  add_index "replies", ["tweet_id"], name: "index_replies_on_tweet_id"
  add_index "replies", ["user_id"], name: "index_replies_on_user_id"

  create_table "retweets", force: :cascade do |t|
    t.integer "user_id"
    t.integer "tweet_id"
  end

  add_index "retweets", ["tweet_id"], name: "index_retweets_on_tweet_id"
  add_index "retweets", ["user_id"], name: "index_retweets_on_user_id"

  create_table "tweets", force: :cascade do |t|
    t.integer  "user_id"
    t.text     "content"
    t.string   "photo_url"
    t.datetime "create_time"
  end

  add_index "tweets", ["user_id"], name: "index_tweets_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string "user_name"
    t.string "password"
    t.string "email"
    t.string "photo_url"
    t.string "name"
  end

end

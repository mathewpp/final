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
    t.text     "message"
    t.integer  "sender_id"
    t.integer  "receiver_id"
    t.datetime "create_time"
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
    t.integer "followed_id"
    t.integer "follower_id"
  end

  add_index "follows", ["followed_id"], name: "index_follows_on_followed_id"
  add_index "follows", ["follower_id"], name: "index_follows_on_follower_id"

  create_table "group_users", force: :cascade do |t|
    t.integer "group_id"
    t.integer "user_id"
  end

  add_index "group_users", ["group_id"], name: "index_group_users_on_group_id"
  add_index "group_users", ["user_id"], name: "index_group_users_on_user_id"

  create_table "groups", force: :cascade do |t|
    t.string "name"
    t.string "description"
  end

  create_table "notifications", force: :cascade do |t|
    t.string   "message"
    t.string   "create_user"
    t.datetime "create_time"
    t.datetime "expiry_time"
  end

  create_table "replies", force: :cascade do |t|
    t.text     "message"
    t.integer  "user_id"
    t.integer  "tweet_id"
    t.datetime "create_time"
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
    t.string "email"
    t.string "name"
    t.string "photo_url"
    t.string "password_digest"
    t.string "category"
  end

end
